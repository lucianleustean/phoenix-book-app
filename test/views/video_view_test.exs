defmodule BookApp.VideoViewTest do
  import Phoenix.View
  import BookApp.Factories

  use BookApp.ConnCase

  setup %{conn: conn} do
    videos = [insert(:video, title: "dogs"), insert(:video, title: "cats")]
    {:ok, conn: conn, videos: videos}
  end

  test "renders index.html", %{conn: conn, videos: videos} do
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
