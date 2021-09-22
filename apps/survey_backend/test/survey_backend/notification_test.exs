defmodule SurveyBackend.NotificationTest do
  use SurveyBackend.DataCase

  alias SurveyBackend.Notification

  describe "notification" do
    alias SurveyBackend.Notification.Notifications

    @valid_attrs %{channel: "some channel", message: "some message", status: true}
    @update_attrs %{channel: "some updated channel", message: "some updated message", status: false}
    @invalid_attrs %{channel: nil, message: nil, status: nil}

    def notifications_fixture(attrs \\ %{}) do
      {:ok, notifications} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Notification.create_notifications()

      notifications
    end

    test "list_notification/0 returns all notification" do
      notifications = notifications_fixture()
      assert Notification.list_notification() == [notifications]
    end

    test "get_notifications!/1 returns the notifications with given id" do
      notifications = notifications_fixture()
      assert Notification.get_notifications!(notifications.id) == notifications
    end

    test "create_notifications/1 with valid data creates a notifications" do
      assert {:ok, %Notifications{} = notifications} = Notification.create_notifications(@valid_attrs)
      assert notifications.channel == "some channel"
      assert notifications.message == "some message"
      assert notifications.status == true
    end

    test "create_notifications/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Notification.create_notifications(@invalid_attrs)
    end

    test "update_notifications/2 with valid data updates the notifications" do
      notifications = notifications_fixture()
      assert {:ok, %Notifications{} = notifications} = Notification.update_notifications(notifications, @update_attrs)
      assert notifications.channel == "some updated channel"
      assert notifications.message == "some updated message"
      assert notifications.status == false
    end

    test "update_notifications/2 with invalid data returns error changeset" do
      notifications = notifications_fixture()
      assert {:error, %Ecto.Changeset{}} = Notification.update_notifications(notifications, @invalid_attrs)
      assert notifications == Notification.get_notifications!(notifications.id)
    end

    test "delete_notifications/1 deletes the notifications" do
      notifications = notifications_fixture()
      assert {:ok, %Notifications{}} = Notification.delete_notifications(notifications)
      assert_raise Ecto.NoResultsError, fn -> Notification.get_notifications!(notifications.id) end
    end

    test "change_notifications/1 returns a notifications changeset" do
      notifications = notifications_fixture()
      assert %Ecto.Changeset{} = Notification.change_notifications(notifications)
    end
  end
end
