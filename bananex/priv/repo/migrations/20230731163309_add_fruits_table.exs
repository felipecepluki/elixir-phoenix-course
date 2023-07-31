defmodule Bananex.Repo.Migrations.AddFruitsTable do
  use Ecto.Migration

  def change do
    create table(:fruits) do
      add :name, :string
    end
  end
end
