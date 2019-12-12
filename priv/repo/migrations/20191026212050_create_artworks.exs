defmodule Artsy.Repo.Migrations.CreateArtworks do
  use Ecto.Migration

  def change do
    create table(:artworks, primary_key: false) do
      add :id, :string, size: 100, primary_key: true, autogenerate: false
      add :image_url, :text
      add :display_name, :text
      add :dimentions, :string

      timestamps()
    end

  end
end
