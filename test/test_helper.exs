{:ok, _} = Application.ensure_all_started(:ex_machina)

ExUnit.start

Mix.Task.run "ecto.create", ~w(-r BookApp.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r BookApp.Repo --quiet)
Ecto.Adapters.SQL.Sandbox.mode(BookApp.Repo, :manual)
