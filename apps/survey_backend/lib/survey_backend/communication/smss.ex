defmodule SurveyBackend.Communication.Smss do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sms" do
    field :message, :string
    field :phone, :string

    belongs_to :users, SurveyBackend.Usermanagement.Users
    timestamps()
  end

  @doc false
  def changeset(smss, attrs) do
    smss
    |> cast(attrs, [:phone, :message])
    |> validate_required([:phone, :message])
  end
end
