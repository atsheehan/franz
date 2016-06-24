defmodule Franz.MessageController do
  use Franz.Web, :controller

  alias Franz.Message

  def index(conn, _params) do
    messages = Repo.all(Message)
    changeset = Message.changeset(%Message{})
    render conn, "index.html", messages: messages, changeset: changeset
  end

  def create(conn, %{"message" => message_params}) do
    changeset = Message.changeset(%Message{}, message_params)

    case Repo.append_to_log(changeset) do
      {:ok, _changeset} ->
        conn
        |> put_flash(:info, "Message saved.")
        |> redirect(to: message_path(conn, :index))
      {:error, changeset} ->
        messages = Repo.all(Message)
        render(conn, "index.html", messages: messages, changeset: changeset)
    end
  end
end
