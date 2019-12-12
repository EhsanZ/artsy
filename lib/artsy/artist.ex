defmodule Artsy.Artist do
  use Ecto.Schema
  # use Absinthe.Schema

  import Ecto.Changeset

  @primary_key {:id, :string, autogenerate: false}

  schema "artists" do
    Ecto.Schema.field :bio, :string
    Ecto.Schema.field :genes, {:array, :string}
    Ecto.Schema.field :name, :string

    timestamps()
  end

  @doc false
  def changeset(artist, attrs) do
    artist
    |> cast(attrs, [:id, :name, :bio, :genes])
    |> validate_required([:id, :name, :bio, :genes])
  end
end
