defmodule SurveyBackend.Country.Countries do
  use Ecto.Schema
  import Ecto.Changeset

  schema "country" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(countries, attrs) do
    countries
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
