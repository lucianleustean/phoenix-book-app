defmodule BookApp.WatchController do
  alias BookApp.Video

  use BookApp.Web, :controller

  def show(conn, %{"id" => id}) do
    video = Repo.get!(Video, id)
    render conn, "show.html", video: video
  end
end
