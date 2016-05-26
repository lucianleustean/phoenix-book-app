defmodule BookApp.PageController do
  use BookApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
