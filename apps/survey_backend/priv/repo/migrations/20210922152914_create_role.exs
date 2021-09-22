defmodule SurveyBackend.Repo.Migrations.CreateRole do
  use Ecto.Migration

  def change do
    create table(:role) do
      add :name, :string
      add :description, :string

      timestamps()
    end

  end
end
