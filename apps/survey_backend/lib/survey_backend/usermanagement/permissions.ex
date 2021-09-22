defmodule SurveyBackend.Usermanagement.Permissions do
  use Ecto.Schema
  import Ecto.Changeset

  schema "permission" do
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(permissions, attrs) do
    permissions
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
