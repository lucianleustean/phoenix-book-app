defmodule BookApp.Repo do

  def all(BookApp.User) do
    [%BookApp.User{id: "1", name: "Lucian", username: "lucian", password: "elixir"}]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
