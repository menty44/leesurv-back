defmodule SurveyBackend.Repo.Migrations.CreateUserrole do
  use Ecto.Migration

  def change do
    create table(:userrole) do
      add :name, :string

      timestamps()
    end

  end
end
