defmodule SurveyBackendWeb.ActivationsController do
  use SurveyBackendWeb, :controller

  alias SurveyBackend.Usermanagement
  alias SurveyBackend.Usermanagement.Activations

  action_fallback SurveyBackendWeb.FallbackController

  def index(conn, _params) do
    activation = Usermanagement.list_activation()
    render(conn, "index.json", activation: activation)
  end

  def create(conn, %{"activations" => activations_params}) do
    with {:ok, %Activations{} = activations} <- Usermanagement.create_activations(activations_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.activations_path(conn, :show, activations))
      |> render("show.json", activations: activations)
    end
  end

  def show(conn, %{"id" => id}) do
    activations = Usermanagement.get_activations!(id)
    render(conn, "show.json", activations: activations)
  end

  def update(conn, %{"id" => id, "activations" => activations_params}) do
    activations = Usermanagement.get_activations!(id)

    with {:ok, %Activations{} = activations} <- Usermanagement.update_activations(activations, activations_params) do
      render(conn, "show.json", activations: activations)
    end
  end

  def delete(conn, %{"id" => id}) do
    activations = Usermanagement.get_activations!(id)

    with {:ok, %Activations{}} <- Usermanagement.delete_activations(activations) do
      send_resp(conn, :no_content, "")
    end
  end
end
