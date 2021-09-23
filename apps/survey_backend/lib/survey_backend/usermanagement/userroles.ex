defmodule SurveyBackend.Usermanagement.Userroles do
  use Ecto.Schema
  import Ecto.Changeset

  schema "userrole" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(userroles, attrs) do
    userroles
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
