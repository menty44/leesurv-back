defmodule SurveyBackendWeb.PermissionsController do
  use SurveyBackendWeb, :controller

  alias SurveyBackend.Usermanagement
  alias SurveyBackend.Usermanagement.Permissions

  action_fallback SurveyBackendWeb.FallbackController

  def index(conn, _params) do
    permission = Usermanagement.list_permission()
    render(conn, "index.json", permission: permission)
  end

  def create(conn, %{"permissions" => permissions_params}) do
    with {:ok, %Permissions{} = permissions} <- Usermanagement.create_permissions(permissions_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.permissions_path(conn, :show, permissions))
      |> render("show.json", permissions: permissions)
    end
  end

  def show(conn, %{"id" => id}) do
    permissions = Usermanagement.get_permissions!(id)
    render(conn, "show.json", permissions: permissions)
  end

  def update(conn, %{"id" => id, "permissions" => permissions_params}) do
    permissions = Usermanagement.get_permissions!(id)

    with {:ok, %Permissions{} = permissions} <- Usermanagement.update_permissions(permissions, permissions_params) do
      render(conn, "show.json", permissions: permissions)
    end
  end

  def delete(conn, %{"id" => id}) do
    permissions = Usermanagement.get_permissions!(id)

    with {:ok, %Permissions{}} <- Usermanagement.delete_permissions(permissions) do
      send_resp(conn, :no_content, "")
    end
  end
end
