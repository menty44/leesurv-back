defmodule SurveyBackendWeb.ChannelsControllerTest do
  use SurveyBackendWeb.ConnCase

  alias SurveyBackend.Communication
  alias SurveyBackend.Communication.Channels

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:channels) do
    {:ok, channels} = Communication.create_channels(@create_attrs)
    channels
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all channel", %{conn: conn} do
      conn = get(conn, Routes.channels_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create channels" do
    test "renders channels when data is valid", %{conn: conn} do
      conn = post(conn, Routes.channels_path(conn, :create), channels: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.channels_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.channels_path(conn, :create), channels: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update channels" do
    setup [:create_channels]

    test "renders channels when data is valid", %{conn: conn, channels: %Channels{id: id} = channels} do
      conn = put(conn, Routes.channels_path(conn, :update, channels), channels: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.channels_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, channels: channels} do
      conn = put(conn, Routes.channels_path(conn, :update, channels), channels: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete channels" do
    setup [:create_channels]

    test "deletes chosen channels", %{conn: conn, channels: channels} do
      conn = delete(conn, Routes.channels_path(conn, :delete, channels))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.channels_path(conn, :show, channels))
      end
    end
  end

  defp create_channels(_) do
    channels = fixture(:channels)
    %{channels: channels}
  end
end
