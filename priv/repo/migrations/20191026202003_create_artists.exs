defmodule Artsy.Repo.Migrations.CreateArtists do
  use Ecto.Migration

  def change do
    create table(:artists, primary_key: false) do
      add :id, :string, size: 40, primary_key: true, autogenerate: false
      add :name, :string, size: 100, null: false
      add :bio, :text
      add :genes, {:array, :string}

      timestamps()
    end
  end
end
