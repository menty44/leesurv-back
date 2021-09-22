defmodule SurveyBackend.Repo.Migrations.CreateMenu do
  use Ecto.Migration

  def change do
    create table(:menu) do
      add :name, :string
      add :description, :string
      add :active, :boolean, default: false, null: false

      timestamps()
    end

  end
end
