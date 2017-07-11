defmodule BookApp.Factories do
  use ExMachina.Ecto, repo: BookApp.Repo

  alias BookApp.User
  alias BookApp.Video
  alias BookApp.Category

  def user_factory do
    %User{
      username: "max"
    }
  end

  def video_factory do
    %Video{}
  end

  def category_factory do
    %Category{}
  end
end
