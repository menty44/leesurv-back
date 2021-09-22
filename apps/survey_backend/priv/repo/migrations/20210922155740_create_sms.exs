defmodule SurveyBackend.Repo.Migrations.CreateSms do
  use Ecto.Migration

  def change do
    create table(:sms) do
      add :phone, :string
      add :message, :string

      timestamps()
    end

  end
end
