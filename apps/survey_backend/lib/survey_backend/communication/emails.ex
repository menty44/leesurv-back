defmodule SurveyBackend.Communication.Emails do
  use Ecto.Schema
  import Ecto.Changeset

  schema "email" do
    field :email, :string
    field :message, :string
    field :subject, :string

    belongs_to :users, SurveyBackend.Usermanagement.Users

    timestamps()
  end

  @doc false
  def changeset(emails, attrs) do
    emails
    |> cast(attrs, [:email, :subject, :message])
    |> validate_required([:email, :subject, :message])
  end
end
