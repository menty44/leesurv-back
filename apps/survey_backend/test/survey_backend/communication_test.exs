defmodule SurveyBackend.CommunicationTest do
  use SurveyBackend.DataCase

  alias SurveyBackend.Communication

  describe "sms" do
    alias SurveyBackend.Communication.Smss

    @valid_attrs %{message: "some message", phone: "some phone"}
    @update_attrs %{message: "some updated message", phone: "some updated phone"}
    @invalid_attrs %{message: nil, phone: nil}

    def smss_fixture(attrs \\ %{}) do
      {:ok, smss} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Communication.create_smss()

      smss
    end

    test "list_sms/0 returns all sms" do
      smss = smss_fixture()
      assert Communication.list_sms() == [smss]
    end

    test "get_smss!/1 returns the smss with given id" do
      smss = smss_fixture()
      assert Communication.get_smss!(smss.id) == smss
    end

    test "create_smss/1 with valid data creates a smss" do
      assert {:ok, %Smss{} = smss} = Communication.create_smss(@valid_attrs)
      assert smss.message == "some message"
      assert smss.phone == "some phone"
    end

    test "create_smss/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Communication.create_smss(@invalid_attrs)
    end

    test "update_smss/2 with valid data updates the smss" do
      smss = smss_fixture()
      assert {:ok, %Smss{} = smss} = Communication.update_smss(smss, @update_attrs)
      assert smss.message == "some updated message"
      assert smss.phone == "some updated phone"
    end

    test "update_smss/2 with invalid data returns error changeset" do
      smss = smss_fixture()
      assert {:error, %Ecto.Changeset{}} = Communication.update_smss(smss, @invalid_attrs)
      assert smss == Communication.get_smss!(smss.id)
    end

    test "delete_smss/1 deletes the smss" do
      smss = smss_fixture()
      assert {:ok, %Smss{}} = Communication.delete_smss(smss)
      assert_raise Ecto.NoResultsError, fn -> Communication.get_smss!(smss.id) end
    end

    test "change_smss/1 returns a smss changeset" do
      smss = smss_fixture()
      assert %Ecto.Changeset{} = Communication.change_smss(smss)
    end
  end

  describe "email" do
    alias SurveyBackend.Communication.Emails

    @valid_attrs %{email: "some email", message: "some message", subject: "some subject"}
    @update_attrs %{email: "some updated email", message: "some updated message", subject: "some updated subject"}
    @invalid_attrs %{email: nil, message: nil, subject: nil}

    def emails_fixture(attrs \\ %{}) do
      {:ok, emails} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Communication.create_emails()

      emails
    end

    test "list_email/0 returns all email" do
      emails = emails_fixture()
      assert Communication.list_email() == [emails]
    end

    test "get_emails!/1 returns the emails with given id" do
      emails = emails_fixture()
      assert Communication.get_emails!(emails.id) == emails
    end

    test "create_emails/1 with valid data creates a emails" do
      assert {:ok, %Emails{} = emails} = Communication.create_emails(@valid_attrs)
      assert emails.email == "some email"
      assert emails.message == "some message"
      assert emails.subject == "some subject"
    end

    test "create_emails/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Communication.create_emails(@invalid_attrs)
    end

    test "update_emails/2 with valid data updates the emails" do
      emails = emails_fixture()
      assert {:ok, %Emails{} = emails} = Communication.update_emails(emails, @update_attrs)
      assert emails.email == "some updated email"
      assert emails.message == "some updated message"
      assert emails.subject == "some updated subject"
    end

    test "update_emails/2 with invalid data returns error changeset" do
      emails = emails_fixture()
      assert {:error, %Ecto.Changeset{}} = Communication.update_emails(emails, @invalid_attrs)
      assert emails == Communication.get_emails!(emails.id)
    end

    test "delete_emails/1 deletes the emails" do
      emails = emails_fixture()
      assert {:ok, %Emails{}} = Communication.delete_emails(emails)
      assert_raise Ecto.NoResultsError, fn -> Communication.get_emails!(emails.id) end
    end

    test "change_emails/1 returns a emails changeset" do
      emails = emails_fixture()
      assert %Ecto.Changeset{} = Communication.change_emails(emails)
    end
  end

  describe "email" do
    alias SurveyBackend.Communication.Notifications

    @valid_attrs %{channel: "some channel", message: "some message", status: true}
    @update_attrs %{channel: "some updated channel", message: "some updated message", status: false}
    @invalid_attrs %{channel: nil, message: nil, status: nil}

    def notifications_fixture(attrs \\ %{}) do
      {:ok, notifications} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Communication.create_notifications()

      notifications
    end

    test "list_email/0 returns all email" do
      notifications = notifications_fixture()
      assert Communication.list_email() == [notifications]
    end

    test "get_notifications!/1 returns the notifications with given id" do
      notifications = notifications_fixture()
      assert Communication.get_notifications!(notifications.id) == notifications
    end

    test "create_notifications/1 with valid data creates a notifications" do
      assert {:ok, %Notifications{} = notifications} = Communication.create_notifications(@valid_attrs)
      assert notifications.channel == "some channel"
      assert notifications.message == "some message"
      assert notifications.status == true
    end

    test "create_notifications/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Communication.create_notifications(@invalid_attrs)
    end

    test "update_notifications/2 with valid data updates the notifications" do
      notifications = notifications_fixture()
      assert {:ok, %Notifications{} = notifications} = Communication.update_notifications(notifications, @update_attrs)
      assert notifications.channel == "some updated channel"
      assert notifications.message == "some updated message"
      assert notifications.status == false
    end

    test "update_notifications/2 with invalid data returns error changeset" do
      notifications = notifications_fixture()
      assert {:error, %Ecto.Changeset{}} = Communication.update_notifications(notifications, @invalid_attrs)
      assert notifications == Communication.get_notifications!(notifications.id)
    end

    test "delete_notifications/1 deletes the notifications" do
      notifications = notifications_fixture()
      assert {:ok, %Notifications{}} = Communication.delete_notifications(notifications)
      assert_raise Ecto.NoResultsError, fn -> Communication.get_notifications!(notifications.id) end
    end

    test "change_notifications/1 returns a notifications changeset" do
      notifications = notifications_fixture()
      assert %Ecto.Changeset{} = Communication.change_notifications(notifications)
    end
  end

  describe "channel" do
    alias SurveyBackend.Communication.Channels

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def channels_fixture(attrs \\ %{}) do
      {:ok, channels} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Communication.create_channels()

      channels
    end

    test "list_channel/0 returns all channel" do
      channels = channels_fixture()
      assert Communication.list_channel() == [channels]
    end

    test "get_channels!/1 returns the channels with given id" do
      channels = channels_fixture()
      assert Communication.get_channels!(channels.id) == channels
    end

    test "create_channels/1 with valid data creates a channels" do
      assert {:ok, %Channels{} = channels} = Communication.create_channels(@valid_attrs)
      assert channels.name == "some name"
    end

    test "create_channels/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Communication.create_channels(@invalid_attrs)
    end

    test "update_channels/2 with valid data updates the channels" do
      channels = channels_fixture()
      assert {:ok, %Channels{} = channels} = Communication.update_channels(channels, @update_attrs)
      assert channels.name == "some updated name"
    end

    test "update_channels/2 with invalid data returns error changeset" do
      channels = channels_fixture()
      assert {:error, %Ecto.Changeset{}} = Communication.update_channels(channels, @invalid_attrs)
      assert channels == Communication.get_channels!(channels.id)
    end

    test "delete_channels/1 deletes the channels" do
      channels = channels_fixture()
      assert {:ok, %Channels{}} = Communication.delete_channels(channels)
      assert_raise Ecto.NoResultsError, fn -> Communication.get_channels!(channels.id) end
    end

    test "change_channels/1 returns a channels changeset" do
      channels = channels_fixture()
      assert %Ecto.Changeset{} = Communication.change_channels(channels)
    end
  end
end
