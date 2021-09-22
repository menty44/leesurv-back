defmodule SurveyBackend.Notification.Notifications do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notification" do
    field :channel, :string
    field :message, :string
    field :status, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(notifications, attrs) do
    notifications
    |> cast(attrs, [:channel, :status, :message])
    |> validate_required([:channel, :status, :message])
  end
end
