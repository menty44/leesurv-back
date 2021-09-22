defmodule SurveyBackendWeb.NotificationsController do
  use SurveyBackendWeb, :controller

  alias SurveyBackend.Notification
  alias SurveyBackend.Notification.Notifications

  action_fallback SurveyBackendWeb.FallbackController

  def index(conn, _params) do
    notification = Notification.list_notification()
    render(conn, "index.json", notification: notification)
  end

  def create(conn, %{"notifications" => notifications_params}) do
    with {:ok, %Notifications{} = notifications} <- Notification.create_notifications(notifications_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.notifications_path(conn, :show, notifications))
      |> render("show.json", notifications: notifications)
    end
  end

  def show(conn, %{"id" => id}) do
    notifications = Notification.get_notifications!(id)
    render(conn, "show.json", notifications: notifications)
  end

  def update(conn, %{"id" => id, "notifications" => notifications_params}) do
    notifications = Notification.get_notifications!(id)

    with {:ok, %Notifications{} = notifications} <- Notification.update_notifications(notifications, notifications_params) do
      render(conn, "show.json", notifications: notifications)
    end
  end

  def delete(conn, %{"id" => id}) do
    notifications = Notification.get_notifications!(id)

    with {:ok, %Notifications{}} <- Notification.delete_notifications(notifications) do
      send_resp(conn, :no_content, "")
    end
  end
end
