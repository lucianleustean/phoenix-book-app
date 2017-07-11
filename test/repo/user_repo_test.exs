defmodule BookApp.UserRepoTest do
  alias BookApp.User

  use BookApp.ModelCase

  @valid_attrs %{name: "A User", username: "eva"}

  test "converts unique_constraint on username to error" do
    insert_user(%{username: "eric"})
    attrs = Map.put(@valid_attrs, :username, "eric")
    changeset = User.changeset(%User{}, attrs)

    assert {:error, changeset} = Repo.insert(changeset)
    assert {:username, {"has already been taken", []}}
      in changeset.errors
  end
end
