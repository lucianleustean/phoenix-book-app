# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     BookApp.Repo.insert!(%BookApp.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias BookApp.Repo
alias BookApp.Category

for category <- ~w(Action Drama Romance Comedy Sci-fi Others) do
  Repo.get_by(Category, name: category) ||
    Repo.insert!(%Category{name: category})
end
