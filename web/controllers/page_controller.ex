defmodule Franz.PageController do
  use Franz.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
