defmodule SurveyBackendWeb.NotificationsControllerTest do
  use SurveyBackendWeb.ConnCase

  alias SurveyBackend.Notification
  alias SurveyBackend.Notification.Notifications

  @create_attrs %{
    channel: "some channel",
    message: "some message",
    status: true
  }
  @update_attrs %{
    channel: "some updated channel",
    message: "some updated message",
    status: false
  }
  @invalid_attrs %{channel: nil, message: nil, status: nil}

  def fixture(:notifications) do
    {:ok, notifications} = Notification.create_notifications(@create_attrs)
    notifications
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all notification", %{conn: conn} do
      conn = get(conn, Routes.notifications_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create notifications" do
    test "renders notifications when data is valid", %{conn: conn} do
      conn = post(conn, Routes.notifications_path(conn, :create), notifications: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.notifications_path(conn, :show, id))

      assert %{
               "id" => id,
               "channel" => "some channel",
               "message" => "some message",
               "status" => true
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.notifications_path(conn, :create), notifications: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update notifications" do
    setup [:create_notifications]

    test "renders notifications when data is valid", %{conn: conn, notifications: %Notifications{id: id} = notifications} do
      conn = put(conn, Routes.notifications_path(conn, :update, notifications), notifications: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.notifications_path(conn, :show, id))

      assert %{
               "id" => id,
               "channel" => "some updated channel",
               "message" => "some updated message",
               "status" => false
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, notifications: notifications} do
      conn = put(conn, Routes.notifications_path(conn, :update, notifications), notifications: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete notifications" do
    setup [:create_notifications]

    test "deletes chosen notifications", %{conn: conn, notifications: notifications} do
      conn = delete(conn, Routes.notifications_path(conn, :delete, notifications))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.notifications_path(conn, :show, notifications))
      end
    end
  end

  defp create_notifications(_) do
    notifications = fixture(:notifications)
    %{notifications: notifications}
  end
end
