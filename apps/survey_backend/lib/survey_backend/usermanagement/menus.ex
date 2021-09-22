defmodule SurveyBackend.Usermanagement.Menus do
  use Ecto.Schema
  import Ecto.Changeset

  schema "menu" do
    field :active, :boolean, default: false
    field :description, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(menus, attrs) do
    menus
    |> cast(attrs, [:name, :description, :active])
    |> validate_required([:name, :description, :active])
  end
end
