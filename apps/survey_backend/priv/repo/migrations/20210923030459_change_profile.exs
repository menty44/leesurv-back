defmodule SurveyBackend.Repo.Migrations.CreateProfile do
  use Ecto.Migration

  def change do
    create table(:profile) do
      add :image, :text
      add :dob, :string
      add :country, :string

      add :user_id, references(:user)

      timestamps()
    end
    create unique_index(:profile, [:user_id])

  end
end
