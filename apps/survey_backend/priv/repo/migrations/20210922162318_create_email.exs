defmodule SurveyBackend.Repo.Migrations.CreateEmail do
  use Ecto.Migration

  def change do
    create table(:email) do
      add :channel, :string
      add :status, :boolean, default: false, null: false
      add :message, :string

      timestamps()
    end

  end
end
