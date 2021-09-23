defmodule SurveyBackend.Communication.Notifications do
  use Ecto.Schema
  import Ecto.Changeset

  schema "email" do
    field :channel, :string
    field :message, :string
    field :status, :boolean, default: false

    belongs_to :users, SurveyBackend.Usermanagement.Users
    belongs_to :organizations, SurveyBackend.Organization.Organizations

    timestamps()
  end

  @doc false
  def changeset(notifications, attrs) do
    notifications
    |> cast(attrs, [:channel, :status, :message])
    |> validate_required([:channel, :status, :message])
  end
end
