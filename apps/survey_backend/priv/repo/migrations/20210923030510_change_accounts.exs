defmodule SurveyBackend.Repo.Migrations.CreateAccount do
  use Ecto.Migration

  def change do
    create table(:account) do
      add :code, :string

      add :user_id, references(:user)

      timestamps()
    end
    create unique_index(:account, [:user_id])

  end
end
