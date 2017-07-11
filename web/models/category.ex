defmodule BookApp.Category do
  use BookApp.Web, :model

  schema "categories" do
    field :name, :string

    timestamps()
  end

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ %{}) do
    model
    |> cast(params, ~w(name))
    |> validate_required(~w(name)a)
  end
end
