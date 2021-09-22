defmodule SurveyBackend.Repo.Migrations.CreateCountry do
  use Ecto.Migration

  def change do
    create table(:country) do
      add :name, :string

      timestamps()
    end

  end
end
