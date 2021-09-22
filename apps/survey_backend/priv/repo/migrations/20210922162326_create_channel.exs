defmodule SurveyBackend.Repo.Migrations.CreateChannel do
  use Ecto.Migration

  def change do
    create table(:channel) do
      add :name, :string

      timestamps()
    end

  end
end
