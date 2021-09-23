defmodule SurveyBackendWeb.UserrolesController do
  use SurveyBackendWeb, :controller

  alias SurveyBackend.Usermanagement
  alias SurveyBackend.Usermanagement.Userroles

  action_fallback SurveyBackendWeb.FallbackController

  def index(conn, _params) do
    userrole = Usermanagement.list_userrole()
    render(conn, "index.json", userrole: userrole)
  end

  def create(conn, %{"userroles" => userroles_params}) do
    with {:ok, %Userroles{} = userroles} <- Usermanagement.create_userroles(userroles_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.userroles_path(conn, :show, userroles))
      |> render("show.json", userroles: userroles)
    end
  end

  def show(conn, %{"id" => id}) do
    userroles = Usermanagement.get_userroles!(id)
    render(conn, "show.json", userroles: userroles)
  end

  def update(conn, %{"id" => id, "userroles" => userroles_params}) do
    userroles = Usermanagement.get_userroles!(id)

    with {:ok, %Userroles{} = userroles} <- Usermanagement.update_userroles(userroles, userroles_params) do
      render(conn, "show.json", userroles: userroles)
    end
  end

  def delete(conn, %{"id" => id}) do
    userroles = Usermanagement.get_userroles!(id)

    with {:ok, %Userroles{}} <- Usermanagement.delete_userroles(userroles) do
      send_resp(conn, :no_content, "")
    end
  end
end
