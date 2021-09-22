defmodule SurveyBackendWeb.UsersController do
  use SurveyBackendWeb, :controller

  alias SurveyBackend.Usermanagement
  alias SurveyBackend.Usermanagement.Users

  action_fallback SurveyBackendWeb.FallbackController

  def index(conn, _params) do
    user = Usermanagement.list_user()
    render(conn, "index.json", user: user)
  end

  def create(conn, %{"users" => users_params}) do
    with {:ok, %Users{} = users} <- Usermanagement.create_users(users_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.users_path(conn, :show, users))
      |> render("show.json", users: users)
    end
  end

  def show(conn, %{"id" => id}) do
    users = Usermanagement.get_users!(id)
    render(conn, "show.json", users: users)
  end

  def update(conn, %{"id" => id, "users" => users_params}) do
    users = Usermanagement.get_users!(id)

    with {:ok, %Users{} = users} <- Usermanagement.update_users(users, users_params) do
      render(conn, "show.json", users: users)
    end
  end

  def delete(conn, %{"id" => id}) do
    users = Usermanagement.get_users!(id)

    with {:ok, %Users{}} <- Usermanagement.delete_users(users) do
      send_resp(conn, :no_content, "")
    end
  end
end
