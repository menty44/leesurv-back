defmodule SurveyBackendWeb.ChannelsController do
  use SurveyBackendWeb, :controller

  alias SurveyBackend.Communication
  alias SurveyBackend.Communication.Channels

  action_fallback SurveyBackendWeb.FallbackController

  def index(conn, _params) do
    channel = Communication.list_channel()
    render(conn, "index.json", channel: channel)
  end

  def create(conn, %{"channels" => channels_params}) do
    with {:ok, %Channels{} = channels} <- Communication.create_channels(channels_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.channels_path(conn, :show, channels))
      |> render("show.json", channels: channels)
    end
  end

  def show(conn, %{"id" => id}) do
    channels = Communication.get_channels!(id)
    render(conn, "show.json", channels: channels)
  end

  def update(conn, %{"id" => id, "channels" => channels_params}) do
    channels = Communication.get_channels!(id)

    with {:ok, %Channels{} = channels} <- Communication.update_channels(channels, channels_params) do
      render(conn, "show.json", channels: channels)
    end
  end

  def delete(conn, %{"id" => id}) do
    channels = Communication.get_channels!(id)

    with {:ok, %Channels{}} <- Communication.delete_channels(channels) do
      send_resp(conn, :no_content, "")
    end
  end
end
