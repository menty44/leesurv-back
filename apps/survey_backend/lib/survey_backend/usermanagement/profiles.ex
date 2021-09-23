defmodule SurveyBackend.Usermanagement.Profiles do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profile" do
    field :country, :string
    field :dob, :string
    field :image, :string

    belongs_to :user, SurveyBackend.Usermanagement.Users

    timestamps()
  end

  @doc false
  def changeset(profiles, attrs) do
    profiles
    |> cast(attrs, [:image, :dob, :country])
    |> validate_required([:image, :dob, :country])
  end
end
