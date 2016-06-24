defmodule Franz.MessageController do
  use Franz.Web, :controller

  alias Franz.Message

  def index(conn, _params) do
    messages = Repo.all(Message)
    render conn, "index.html", messages: messages
  end

  def new(conn, _params) do
    changeset = Message.changeset(%Message{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"message" => message_params}) do
    changeset = Message.changeset(%Message{}, message_params)

    case Repo.insert(changeset) do
      {:ok, message} ->
        conn
        |> put_flash(:info, "Message saved.")
        |> redirect(to: message_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
