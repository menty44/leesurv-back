defmodule SurveyBackend.Usermanagement.Activations do
  use Ecto.Schema
  import Ecto.Changeset

  schema "activation" do
    field :clicked, :boolean, default: false
    field :code, :string
    field :email, :string

    timestamps()
  end

  @doc false
  def changeset(activations, attrs) do
    activations
    |> cast(attrs, [:email, :code, :clicked])
    |> validate_required([:email, :code, :clicked])
  end
end
