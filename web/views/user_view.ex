defmodule BookApp.UserView do
  use BookApp.Web, :view
  alias BookApp.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end
