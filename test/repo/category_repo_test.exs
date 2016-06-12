defmodule BookApp.CategoryRepoTest do
  alias BookApp.Category
  alias BookApp.CategoryRepo

  use BookApp.ModelCase

  test "alphabetical/1 orders by name" do
    Repo.insert!(%Category{name: "c"})
    Repo.insert!(%Category{name: "a"})
    Repo.insert!(%Category{name: "b"})

    query = Category |> CategoryRepo.alphabetical()
    query = from c in query, select: c.name
    assert Repo.all(query) == ~w(a b c)
  end
end
