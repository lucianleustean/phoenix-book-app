defmodule BookApp.UserController do
  use BookApp.Web, :controller

  def index(conn, _params) do
    users = Repo.all(BookApp.User)
    render conn, "index.html", users: users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(BookApp.User, id)
    render conn, "show.html", user: user
  end
end
