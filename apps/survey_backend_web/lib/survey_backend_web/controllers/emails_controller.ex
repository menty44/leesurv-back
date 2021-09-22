defmodule SurveyBackendWeb.EmailsController do
  use SurveyBackendWeb, :controller

  alias SurveyBackend.Communication
  alias SurveyBackend.Communication.Emails

  action_fallback SurveyBackendWeb.FallbackController

  def index(conn, _params) do
    email = Communication.list_email()
    render(conn, "index.json", email: email)
  end

  def create(conn, %{"emails" => emails_params}) do
    with {:ok, %Emails{} = emails} <- Communication.create_emails(emails_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.emails_path(conn, :show, emails))
      |> render("show.json", emails: emails)
    end
  end

  def show(conn, %{"id" => id}) do
    emails = Communication.get_emails!(id)
    render(conn, "show.json", emails: emails)
  end

  def update(conn, %{"id" => id, "emails" => emails_params}) do
    emails = Communication.get_emails!(id)

    with {:ok, %Emails{} = emails} <- Communication.update_emails(emails, emails_params) do
      render(conn, "show.json", emails: emails)
    end
  end

  def delete(conn, %{"id" => id}) do
    emails = Communication.get_emails!(id)

    with {:ok, %Emails{}} <- Communication.delete_emails(emails) do
      send_resp(conn, :no_content, "")
    end
  end
end
