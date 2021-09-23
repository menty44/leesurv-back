defmodule SurveyBackend.Usermanagement.Users do
  alias SurveyBackend.Usermanagement
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
    field :type, :string

    has_one :account, SurveyBackend.Usermanagement.Account
    has_one :roles, SurveyBackend.Usermanagement.Roles
    has_one :profile, SurveyBackend.Usermanagement.Profiles

    has_many :smss, SurveyBackend.Communication.Smss
    has_many :emails, SurveyBackend.Communication.Emails
    has_many :notifications, SurveyBackend.Communication.Notifications

    belongs_to :organizations, SurveyBackend.Organization.Organizations

    many_to_many :menus, SurveyBackend.Usermanagement.Menus, join_through: "role_permissions"

    timestamps()
  end

  @doc false
  def changeset(users, attrs) do
    users
    |> cast(attrs, [:firstname, :lastname, :gender, :phone, :email, :status, :verified, :type])
    |> validate_required([:firstname, :lastname, :gender, :phone, :email, :status, :verified, :type])
  end
end
