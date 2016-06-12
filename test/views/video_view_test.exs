defmodule BookApp.VideoViewTest do
  import Phoenix.View

  use BookApp.ConnCase

  test "renders index.html", %{conn: conn} do
    videos = [%BookApp.Video{id: "1", title: "dogs"},
              %BookApp.Video{id: "2", title: "cats"}]
    content = render_to_string(BookApp.VideoView, "index.html",
                               conn: conn, videos: videos)

    assert String.contains?(content, "Listing videos")

    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end

  test "renders new.html", %{conn: conn} do
    changeset = BookApp.Video.changeset(%BookApp.Video{}, %{})
    categories = [{"cats", 123}]
    content = render_to_string(BookApp.VideoView, "new.html",
      conn: conn, changeset: changeset, categories: categories)

    assert String.contains?(content, "New video")
  end
end
