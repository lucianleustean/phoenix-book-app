defmodule BookApp.Video do
  use BookApp.Web, :model

  @primary_key {:id, BookApp.Permalink, autogenerate: true}

  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string
    field :slug, :string
    belongs_to :user, BookApp.User
    belongs_to :category, BookApp.Category

    timestamps
  end

  @required_fields ~w(url title description)
  @optional_fields ~w(category_id)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> slugify_title()
    |> assoc_constraint(:category)
  end

  defp slugify_title(changeset) do
    if title = get_change(changeset, :title) do
      IO.inspect title
      put_change(changeset, :slug, slugify(title))
    else
      changeset
    end
  end

  defp slugify(str) do
    IO.inspect str
    |> String.downcase()
    |> String.replace(~r/[^\w-]+/, "-")
  end

  defimpl Phoenix.Param, for: BookApp.Video do
    def to_param(%{slug: slug, id: id}) do
      "#{id}-#{slug}"
    end
  end
end
