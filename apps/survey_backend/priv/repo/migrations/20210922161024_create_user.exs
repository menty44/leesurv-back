defmodule SurveyBackend.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :firstname, :string
      add :lastname, :string
      add :gender, :string
      add :phone, :string
      add :email, :string
      add :status, :boolean, default: false, null: false
      add :verified, :string
      add :type, :string

      timestamps()
    end

  end
end
