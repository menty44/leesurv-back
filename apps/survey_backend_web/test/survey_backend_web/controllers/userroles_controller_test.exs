defmodule SurveyBackendWeb.UserrolesControllerTest do
  use SurveyBackendWeb.ConnCase

  alias SurveyBackend.Usermanagement
  alias SurveyBackend.Usermanagement.Userroles

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:userroles) do
    {:ok, userroles} = Usermanagement.create_userroles(@create_attrs)
    userroles
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all userrole", %{conn: conn} do
      conn = get(conn, Routes.userroles_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create userroles" do
    test "renders userroles when data is valid", %{conn: conn} do
      conn = post(conn, Routes.userroles_path(conn, :create), userroles: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.userroles_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.userroles_path(conn, :create), userroles: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update userroles" do
    setup [:create_userroles]

    test "renders userroles when data is valid", %{conn: conn, userroles: %Userroles{id: id} = userroles} do
      conn = put(conn, Routes.userroles_path(conn, :update, userroles), userroles: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.userroles_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, userroles: userroles} do
      conn = put(conn, Routes.userroles_path(conn, :update, userroles), userroles: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete userroles" do
    setup [:create_userroles]

    test "deletes chosen userroles", %{conn: conn, userroles: userroles} do
      conn = delete(conn, Routes.userroles_path(conn, :delete, userroles))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.userroles_path(conn, :show, userroles))
      end
    end
  end

  defp create_userroles(_) do
    userroles = fixture(:userroles)
    %{userroles: userroles}
  end
end
