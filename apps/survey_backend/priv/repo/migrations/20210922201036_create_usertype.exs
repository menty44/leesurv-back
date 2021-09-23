defmodule SurveyBackend.Repo.Migrations.CreateUsertype do
  use Ecto.Migration

  def change do
    create table(:usertype) do
      add :name, :string

      timestamps()
    end

  end
end
