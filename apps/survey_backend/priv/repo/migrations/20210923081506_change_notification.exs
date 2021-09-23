defmodule SurveyBackend.Repo.Migrations.CreateNotification do
  use Ecto.Migration

  def change do
    create table(:notification) do
      add :channel, :string
      add :status, :boolean, default: false, null: false
      add :message, :string

      add :user_id, references(:user)
      add :organization_id, references(:user)
      timestamps()
    end
    create unique_index(:notification, [:user_id])
    create unique_index(:notification, [:organization_id])
  end
end
