defmodule SurveyBackend.Usermanagement.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "account" do
    field :code, :string

    belongs_to :user, SurveyBackend.Usermanagement.Users
    timestamps()
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:code])
    |> validate_required([:code])
  end
end
