ExUnit.start

Mix.Task.run "ecto.create", ~w(-r BookApp.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r BookApp.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(BookApp.Repo)

