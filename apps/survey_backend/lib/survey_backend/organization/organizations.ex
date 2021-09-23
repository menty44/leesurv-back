defmodule SurveyBackend.Organization.Organizations do
  use Ecto.Schema
  import Ecto.Changeset

  schema "organization" do
    field :businessname, :string
    field :email, :string
    field :imgurl, :string
    field :website, :string

    has_many :user, SurveyBackend.Usermanagement.Users
    has_many :notifications, SurveyBackend.Communication.Notifications

    timestamps()
  end

  @doc false
  def changeset(organizations, attrs) do
    organizations
    |> cast(attrs, [:businessname, :email, :website, :imgurl])
    |> validate_required([:businessname, :email, :website, :imgurl])
  end
end
