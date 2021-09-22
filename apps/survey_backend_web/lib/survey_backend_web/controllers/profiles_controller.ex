defmodule SurveyBackendWeb.ProfilesController do
  use SurveyBackendWeb, :controller

  alias SurveyBackend.Usermanagement
  alias SurveyBackend.Usermanagement.Profiles

  action_fallback SurveyBackendWeb.FallbackController

  def index(conn, _params) do
    profile = Usermanagement.list_profile()
    render(conn, "index.json", profile: profile)
  end

  def create(conn, %{"profiles" => profiles_params}) do
    with {:ok, %Profiles{} = profiles} <- Usermanagement.create_profiles(profiles_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.profiles_path(conn, :show, profiles))
      |> render("show.json", profiles: profiles)
    end
  end

  def show(conn, %{"id" => id}) do
    profiles = Usermanagement.get_profiles!(id)
    render(conn, "show.json", profiles: profiles)
  end

  def update(conn, %{"id" => id, "profiles" => profiles_params}) do
    profiles = Usermanagement.get_profiles!(id)

    with {:ok, %Profiles{} = profiles} <- Usermanagement.update_profiles(profiles, profiles_params) do
      render(conn, "show.json", profiles: profiles)
    end
  end

  def delete(conn, %{"id" => id}) do
    profiles = Usermanagement.get_profiles!(id)

    with {:ok, %Profiles{}} <- Usermanagement.delete_profiles(profiles) do
      send_resp(conn, :no_content, "")
    end
  end
end
