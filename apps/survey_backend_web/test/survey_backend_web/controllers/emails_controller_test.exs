defmodule SurveyBackendWeb.EmailsControllerTest do
  use SurveyBackendWeb.ConnCase

  alias SurveyBackend.Communication
  alias SurveyBackend.Communication.Emails

  @create_attrs %{
    email: "some email",
    message: "some message",
    subject: "some subject"
  }
  @update_attrs %{
    email: "some updated email",
    message: "some updated message",
    subject: "some updated subject"
  }
  @invalid_attrs %{email: nil, message: nil, subject: nil}

  def fixture(:emails) do
    {:ok, emails} = Communication.create_emails(@create_attrs)
    emails
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all email", %{conn: conn} do
      conn = get(conn, Routes.emails_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create emails" do
    test "renders emails when data is valid", %{conn: conn} do
      conn = post(conn, Routes.emails_path(conn, :create), emails: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.emails_path(conn, :show, id))

      assert %{
               "id" => id,
               "email" => "some email",
               "message" => "some message",
               "subject" => "some subject"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.emails_path(conn, :create), emails: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update emails" do
    setup [:create_emails]

    test "renders emails when data is valid", %{conn: conn, emails: %Emails{id: id} = emails} do
      conn = put(conn, Routes.emails_path(conn, :update, emails), emails: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.emails_path(conn, :show, id))

      assert %{
               "id" => id,
               "email" => "some updated email",
               "message" => "some updated message",
               "subject" => "some updated subject"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, emails: emails} do
      conn = put(conn, Routes.emails_path(conn, :update, emails), emails: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete emails" do
    setup [:create_emails]

    test "deletes chosen emails", %{conn: conn, emails: emails} do
      conn = delete(conn, Routes.emails_path(conn, :delete, emails))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.emails_path(conn, :show, emails))
      end
    end
  end

  defp create_emails(_) do
    emails = fixture(:emails)
    %{emails: emails}
  end
end
