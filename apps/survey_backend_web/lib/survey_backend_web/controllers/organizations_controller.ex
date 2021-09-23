defmodule SurveyBackendWeb.OrganizationsController do
  use SurveyBackendWeb, :controller

  alias SurveyBackend.Organization
  alias SurveyBackend.Organization.Organizations

  action_fallback SurveyBackendWeb.FallbackController

  def index(conn, _params) do
    organization = Organization.list_organization()
    render(conn, "index.json", organization: organization)
  end

  def create(conn, %{"organizations" => organizations_params}) do
    with {:ok, %Organizations{} = organizations} <- Organization.create_organizations(organizations_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.organizations_path(conn, :show, organizations))
      |> render("show.json", organizations: organizations)
    end
  end

  def show(conn, %{"id" => id}) do
    organizations = Organization.get_organizations!(id)
    render(conn, "show.json", organizations: organizations)
  end

  def update(conn, %{"id" => id, "organizations" => organizations_params}) do
    organizations = Organization.get_organizations!(id)

    with {:ok, %Organizations{} = organizations} <- Organization.update_organizations(organizations, organizations_params) do
      render(conn, "show.json", organizations: organizations)
    end
  end

  def delete(conn, %{"id" => id}) do
    organizations = Organization.get_organizations!(id)

    with {:ok, %Organizations{}} <- Organization.delete_organizations(organizations) do
      send_resp(conn, :no_content, "")
    end
  end
end
