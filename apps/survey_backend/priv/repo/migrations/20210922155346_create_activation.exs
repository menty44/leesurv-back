defmodule SurveyBackend.Repo.Migrations.CreateActivation do
  use Ecto.Migration

  def change do
    create table(:activation) do
      add :email, :string
      add :code, :string
      add :clicked, :boolean, default: false, null: false

      timestamps()
    end

  end
end
