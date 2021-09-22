defmodule SurveyBackendWeb.RolesController do
  use SurveyBackendWeb, :controller

  alias SurveyBackend.Usermanagement
  alias SurveyBackend.Usermanagement.Roles

  action_fallback SurveyBackendWeb.FallbackController

  def index(conn, _params) do
    role = Usermanagement.list_role()
    render(conn, "index.json", role: role)
  end

  def create(conn, %{"roles" => roles_params}) do
    with {:ok, %Roles{} = roles} <- Usermanagement.create_roles(roles_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.roles_path(conn, :show, roles))
      |> render("show.json", roles: roles)
    end
  end

  def show(conn, %{"id" => id}) do
    roles = Usermanagement.get_roles!(id)
    render(conn, "show.json", roles: roles)
  end

  def update(conn, %{"id" => id, "roles" => roles_params}) do
    roles = Usermanagement.get_roles!(id)

    with {:ok, %Roles{} = roles} <- Usermanagement.update_roles(roles, roles_params) do
      render(conn, "show.json", roles: roles)
    end
  end

  def delete(conn, %{"id" => id}) do
    roles = Usermanagement.get_roles!(id)

    with {:ok, %Roles{}} <- Usermanagement.delete_roles(roles) do
      send_resp(conn, :no_content, "")
    end
  end
end
