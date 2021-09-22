defmodule SurveyBackendWeb.SmssControllerTest do
  use SurveyBackendWeb.ConnCase

  alias SurveyBackend.Communication
  alias SurveyBackend.Communication.Smss

  @create_attrs %{
    message: "some message",
    phone: "some phone"
  }
  @update_attrs %{
    message: "some updated message",
    phone: "some updated phone"
  }
  @invalid_attrs %{message: nil, phone: nil}

  def fixture(:smss) do
    {:ok, smss} = Communication.create_smss(@create_attrs)
    smss
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all sms", %{conn: conn} do
      conn = get(conn, Routes.smss_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create smss" do
    test "renders smss when data is valid", %{conn: conn} do
      conn = post(conn, Routes.smss_path(conn, :create), smss: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.smss_path(conn, :show, id))

      assert %{
               "id" => id,
               "message" => "some message",
               "phone" => "some phone"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.smss_path(conn, :create), smss: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update smss" do
    setup [:create_smss]

    test "renders smss when data is valid", %{conn: conn, smss: %Smss{id: id} = smss} do
      conn = put(conn, Routes.smss_path(conn, :update, smss), smss: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.smss_path(conn, :show, id))

      assert %{
               "id" => id,
               "message" => "some updated message",
               "phone" => "some updated phone"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, smss: smss} do
      conn = put(conn, Routes.smss_path(conn, :update, smss), smss: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete smss" do
    setup [:create_smss]

    test "deletes chosen smss", %{conn: conn, smss: smss} do
      conn = delete(conn, Routes.smss_path(conn, :delete, smss))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.smss_path(conn, :show, smss))
      end
    end
  end

  defp create_smss(_) do
    smss = fixture(:smss)
    %{smss: smss}
  end
end
