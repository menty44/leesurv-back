defmodule SurveyBackend.Repo.Migrations.CreateAccount do
  use Ecto.Migration

  def change do
    create table(:account) do
      add :code, :string

      timestamps()
    end

  end
end
