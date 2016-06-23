defmodule Franz.MessageController do
  use Franz.Web, :controller

  def index(conn, _params) do
    messages = Repo.all(Franz.Message)
    render conn, "index.html", messages: messages
  end
end
