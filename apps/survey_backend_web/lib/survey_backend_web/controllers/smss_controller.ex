defmodule SurveyBackendWeb.SmssController do
  use SurveyBackendWeb, :controller

  alias SurveyBackend.Communication
  alias SurveyBackend.Communication.Smss

  action_fallback SurveyBackendWeb.FallbackController

  def index(conn, _params) do
    sms = Communication.list_sms()
    render(conn, "index.json", sms: sms)
  end

  def create(conn, %{"smss" => smss_params}) do
    with {:ok, %Smss{} = smss} <- Communication.create_smss(smss_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.smss_path(conn, :show, smss))
      |> render("show.json", smss: smss)
    end
  end

  def show(conn, %{"id" => id}) do
    smss = Communication.get_smss!(id)
    render(conn, "show.json", smss: smss)
  end

  def update(conn, %{"id" => id, "smss" => smss_params}) do
    smss = Communication.get_smss!(id)

    with {:ok, %Smss{} = smss} <- Communication.update_smss(smss, smss_params) do
      render(conn, "show.json", smss: smss)
    end
  end

  def delete(conn, %{"id" => id}) do
    smss = Communication.get_smss!(id)

    with {:ok, %Smss{}} <- Communication.delete_smss(smss) do
      send_resp(conn, :no_content, "")
    end
  end
end
