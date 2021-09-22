defmodule SurveyBackendWeb.AccountView do
  use SurveyBackendWeb, :view
  alias SurveyBackendWeb.AccountView

  def render("index.json", %{account: account}) do
    %{data: render_many(account, AccountView, "account.json")}
  end

  def render("show.json", %{account: account}) do
    %{data: render_one(account, AccountView, "account.json")}
  end

  def render("account.json", %{account: account}) do
    %{id: account.id,
      code: account.code}
  end
end
