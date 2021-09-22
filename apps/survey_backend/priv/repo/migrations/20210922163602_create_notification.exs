defmodule SurveyBackend.Repo.Migrations.CreateNotification do
  use Ecto.Migration

  def change do
    create table(:notification) do
      add :channel, :string
      add :status, :boolean, default: false, null: false
      add :message, :string

      timestamps()
    end

  end
end
