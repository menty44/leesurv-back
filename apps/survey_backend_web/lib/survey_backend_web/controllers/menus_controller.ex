defmodule SurveyBackendWeb.MenusController do
  use SurveyBackendWeb, :controller

  alias SurveyBackend.Usermanagement
  alias SurveyBackend.Usermanagement.Menus

  action_fallback SurveyBackendWeb.FallbackController

  def index(conn, _params) do
    menu = Usermanagement.list_menu()
    render(conn, "index.json", menu: menu)
  end

  def create(conn, %{"menus" => menus_params}) do
    with {:ok, %Menus{} = menus} <- Usermanagement.create_menus(menus_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.menus_path(conn, :show, menus))
      |> render("show.json", menus: menus)
    end
  end

  def show(conn, %{"id" => id}) do
    menus = Usermanagement.get_menus!(id)
    render(conn, "show.json", menus: menus)
  end

  def update(conn, %{"id" => id, "menus" => menus_params}) do
    menus = Usermanagement.get_menus!(id)

    with {:ok, %Menus{} = menus} <- Usermanagement.update_menus(menus, menus_params) do
      render(conn, "show.json", menus: menus)
    end
  end

  def delete(conn, %{"id" => id}) do
    menus = Usermanagement.get_menus!(id)

    with {:ok, %Menus{}} <- Usermanagement.delete_menus(menus) do
      send_resp(conn, :no_content, "")
    end
  end
end
