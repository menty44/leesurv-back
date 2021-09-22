defmodule SurveyBackend.Communication.Channels do
  use Ecto.Schema
  import Ecto.Changeset

  schema "channel" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(channels, attrs) do
    channels
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
