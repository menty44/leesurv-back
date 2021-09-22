defmodule SurveyBackendWeb.AccountController do
  use SurveyBackendWeb, :controller

  alias SurveyBackend.Usermanagement
  alias SurveyBackend.Usermanagement.Account

  action_fallback SurveyBackendWeb.FallbackController

  def index(conn, _params) do
    account = Usermanagement.list_account()
    render(conn, "index.json", account: account)
  end

  def create(conn, %{"account" => account_params}) do
    with {:ok, %Account{} = account} <- Usermanagement.create_account(account_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.account_path(conn, :show, account))
      |> render("show.json", account: account)
    end
  end

  def show(conn, %{"id" => id}) do
    account = Usermanagement.get_account!(id)
    render(conn, "show.json", account: account)
  end

  def update(conn, %{"id" => id, "account" => account_params}) do
    account = Usermanagement.get_account!(id)

    with {:ok, %Account{} = account} <- Usermanagement.update_account(account, account_params) do
      render(conn, "show.json", account: account)
    end
  end

  def delete(conn, %{"id" => id}) do
    account = Usermanagement.get_account!(id)

    with {:ok, %Account{}} <- Usermanagement.delete_account(account) do
      send_resp(conn, :no_content, "")
    end
  end
end
