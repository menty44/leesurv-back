defmodule SurveyBackend.Usermanagement.Usertypes do
  use Ecto.Schema
  import Ecto.Changeset

  schema "usertype" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(usertypes, attrs) do
    usertypes
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
