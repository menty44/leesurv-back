defmodule SurveyBackend.Repo.Migrations.CreatePermission do
  use Ecto.Migration

  def change do
    create table(:permission) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
