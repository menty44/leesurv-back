defmodule SurveyBackendWeb.PermissionsControllerTest do
  use SurveyBackendWeb.ConnCase

  alias SurveyBackend.Usermanagement
  alias SurveyBackend.Usermanagement.Permissions

  @create_attrs %{
    description: "some description",
    name: "some name"
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name"
  }
  @invalid_attrs %{description: nil, name: nil}

  def fixture(:permissions) do
    {:ok, permissions} = Usermanagement.create_permissions(@create_attrs)
    permissions
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all permission", %{conn: conn} do
      conn = get(conn, Routes.permissions_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create permissions" do
    test "renders permissions when data is valid", %{conn: conn} do
      conn = post(conn, Routes.permissions_path(conn, :create), permissions: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.permissions_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.permissions_path(conn, :create), permissions: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update permissions" do
    setup [:create_permissions]

    test "renders permissions when data is valid", %{conn: conn, permissions: %Permissions{id: id} = permissions} do
      conn = put(conn, Routes.permissions_path(conn, :update, permissions), permissions: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.permissions_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, permissions: permissions} do
      conn = put(conn, Routes.permissions_path(conn, :update, permissions), permissions: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete permissions" do
    setup [:create_permissions]

    test "deletes chosen permissions", %{conn: conn, permissions: permissions} do
      conn = delete(conn, Routes.permissions_path(conn, :delete, permissions))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.permissions_path(conn, :show, permissions))
      end
    end
  end

  defp create_permissions(_) do
    permissions = fixture(:permissions)
    %{permissions: permissions}
  end
end
