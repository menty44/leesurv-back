defmodule SurveyBackendWeb.NotificationsView do
  use SurveyBackendWeb, :view
  alias SurveyBackendWeb.NotificationsView

  def render("index.json", %{notification: notification}) do
    %{data: render_many(notification, NotificationsView, "notifications.json")}
  end

  def render("show.json", %{notifications: notifications}) do
    %{data: render_one(notifications, NotificationsView, "notifications.json")}
  end

  def render("notifications.json", %{notifications: notifications}) do
    %{id: notifications.id,
      channel: notifications.channel,
      status: notifications.status,
      message: notifications.message}
  end
end
