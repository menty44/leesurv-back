defmodule SurveyBackendWeb.MenusControllerTest do
  use SurveyBackendWeb.ConnCase

  alias SurveyBackend.Usermanagement
  alias SurveyBackend.Usermanagement.Menus

  @create_attrs %{
    active: true,
    description: "some description",
    name: "some name"
  }
  @update_attrs %{
    active: false,
    description: "some updated description",
    name: "some updated name"
  }
  @invalid_attrs %{active: nil, description: nil, name: nil}

  def fixture(:menus) do
    {:ok, menus} = Usermanagement.create_menus(@create_attrs)
    menus
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all menu", %{conn: conn} do
      conn = get(conn, Routes.menus_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create menus" do
    test "renders menus when data is valid", %{conn: conn} do
      conn = post(conn, Routes.menus_path(conn, :create), menus: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.menus_path(conn, :show, id))

      assert %{
               "id" => id,
               "active" => true,
               "description" => "some description",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.menus_path(conn, :create), menus: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update menus" do
    setup [:create_menus]

    test "renders menus when data is valid", %{conn: conn, menus: %Menus{id: id} = menus} do
      conn = put(conn, Routes.menus_path(conn, :update, menus), menus: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.menus_path(conn, :show, id))

      assert %{
               "id" => id,
               "active" => false,
               "description" => "some updated description",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, menus: menus} do
      conn = put(conn, Routes.menus_path(conn, :update, menus), menus: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete menus" do
    setup [:create_menus]

    test "deletes chosen menus", %{conn: conn, menus: menus} do
      conn = delete(conn, Routes.menus_path(conn, :delete, menus))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.menus_path(conn, :show, menus))
      end
    end
  end

  defp create_menus(_) do
    menus = fixture(:menus)
    %{menus: menus}
  end
end
