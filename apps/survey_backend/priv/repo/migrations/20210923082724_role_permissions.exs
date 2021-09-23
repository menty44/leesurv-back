defmodule SurveyBackend.Repo.Migrations.RolePermissions do
  use Ecto.Migration

  def change do
    create table(:role_permissions) do
      add :role_id, references(:role)
      add :permission_id, references(:permission)
    end
    create unique_index(:role_permissions, [:role_id, :permission_id])
  end
end
