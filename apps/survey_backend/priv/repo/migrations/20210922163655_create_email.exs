defmodule SurveyBackend.Repo.Migrations.CreateEmail do
  use Ecto.Migration

  def change do
    create table(:email) do
      add :email, :string
      add :subject, :string
      add :message, :string

      timestamps()
    end

  end
end
