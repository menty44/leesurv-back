defmodule SurveyBackendWeb.RolesControllerTest do
  use SurveyBackendWeb.ConnCase

  alias SurveyBackend.Usermanagement
  alias SurveyBackend.Usermanagement.Roles

  @create_attrs %{
    description: "some description",
    name: "some name"
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name"
  }
  @invalid_attrs %{description: nil, name: nil}

  def fixture(:roles) do
    {:ok, roles} = Usermanagement.create_roles(@create_attrs)
    roles
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all role", %{conn: conn} do
      conn = get(conn, Routes.roles_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create roles" do
    test "renders roles when data is valid", %{conn: conn} do
      conn = post(conn, Routes.roles_path(conn, :create), roles: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.roles_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.roles_path(conn, :create), roles: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update roles" do
    setup [:create_roles]

    test "renders roles when data is valid", %{conn: conn, roles: %Roles{id: id} = roles} do
      conn = put(conn, Routes.roles_path(conn, :update, roles), roles: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.roles_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, roles: roles} do
      conn = put(conn, Routes.roles_path(conn, :update, roles), roles: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete roles" do
    setup [:create_roles]

    test "deletes chosen roles", %{conn: conn, roles: roles} do
      conn = delete(conn, Routes.roles_path(conn, :delete, roles))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.roles_path(conn, :show, roles))
      end
    end
  end

  defp create_roles(_) do
    roles = fixture(:roles)
    %{roles: roles}
  end
end
