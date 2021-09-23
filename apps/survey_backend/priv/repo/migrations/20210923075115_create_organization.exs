defmodule SurveyBackend.Repo.Migrations.CreateOrganization do
  use Ecto.Migration

  def change do
    create table(:organization) do
      add :businessname, :string
      add :email, :string
      add :website, :string
      add :imgurl, :string

      timestamps()
    end

  end
end
