defmodule BookApp.Factories do
  use ExMachina.Ecto, repo: BookApp.Repo

  alias BookApp.User
  alias BookApp.Video
  alias BookApp.Category

  def factory(:user) do
    %User{
      username: "max"
    }
  end

  def factory(:video) do
    %Video{}
  end

  def factory(:category) do
    %Category{}
  end
end
