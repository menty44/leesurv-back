defmodule SurveyBackendWeb.UsertypesController do
  use SurveyBackendWeb, :controller

  alias SurveyBackend.Usermanagement
  alias SurveyBackend.Usermanagement.Usertypes

  action_fallback SurveyBackendWeb.FallbackController

  def index(conn, _params) do
    usertype = Usermanagement.list_usertype()
    render(conn, "index.json", usertype: usertype)
  end

  def create(conn, %{"usertypes" => usertypes_params}) do
    with {:ok, %Usertypes{} = usertypes} <- Usermanagement.create_usertypes(usertypes_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.usertypes_path(conn, :show, usertypes))
      |> render("show.json", usertypes: usertypes)
    end
  end

  def show(conn, %{"id" => id}) do
    usertypes = Usermanagement.get_usertypes!(id)
    render(conn, "show.json", usertypes: usertypes)
  end

  def update(conn, %{"id" => id, "usertypes" => usertypes_params}) do
    usertypes = Usermanagement.get_usertypes!(id)

    with {:ok, %Usertypes{} = usertypes} <- Usermanagement.update_usertypes(usertypes, usertypes_params) do
      render(conn, "show.json", usertypes: usertypes)
    end
  end

  def delete(conn, %{"id" => id}) do
    usertypes = Usermanagement.get_usertypes!(id)

    with {:ok, %Usertypes{}} <- Usermanagement.delete_usertypes(usertypes) do
      send_resp(conn, :no_content, "")
    end
  end
end
