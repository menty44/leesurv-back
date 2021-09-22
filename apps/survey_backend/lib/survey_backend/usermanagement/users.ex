defmodule SurveyBackend.Usermanagement.Users do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
    field :email, :string
    field :firstname, :string
    field :gender, :string
    field :lastname, :string
    field :phone, :string
    field :status, :boolean, default: false
    field :verified, :string

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:firstname, :lastname, :gender, :phone, :email, :status, :verified])
    |> validate_required([:firstname, :lastname, :gender, :phone, :email, :status, :verified])
  end
end
