defmodule SurveyBackendWeb.ChannelsView do
  use SurveyBackendWeb, :view
  alias SurveyBackendWeb.ChannelsView

  def render("index.json", %{channel: channel}) do
    %{data: render_many(channel, ChannelsView, "channels.json")}
  end

  def render("show.json", %{channels: channels}) do
    %{data: render_one(channels, ChannelsView, "channels.json")}
  end

  def render("channels.json", %{channels: channels}) do
    %{id: channels.id,
      name: channels.name}
  end
end
