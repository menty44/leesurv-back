defmodule SurveyBackend.Repo.Migrations.CreateProfile do
  use Ecto.Migration

  def change do
    create table(:profile) do
      add :image, :text
      add :dob, :string
      add :country, :string

      timestamps()
    end

  end
end
