defmodule SurveyBackend.Usermanagement.Roles do
  use Ecto.Schema
  import Ecto.Changeset

  schema "role" do
    field :description, :string
    field :name, :string

#    belongs_to :user, SurveyBackend.Usermanagement.Users
    many_to_many :permissions, SurveyBackend.Usermanagement.Permissions, join_through: "role_permissions" # I'm new!
    timestamps()
  end

  @doc false
  def changeset(roles, attrs) do
    roles
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
