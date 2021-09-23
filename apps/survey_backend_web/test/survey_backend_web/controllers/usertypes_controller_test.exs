defmodule SurveyBackendWeb.UsertypesControllerTest do
  use SurveyBackendWeb.ConnCase

  alias SurveyBackend.Usermanagement
  alias SurveyBackend.Usermanagement.Usertypes

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:usertypes) do
    {:ok, usertypes} = Usermanagement.create_usertypes(@create_attrs)
    usertypes
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all usertype", %{conn: conn} do
      conn = get(conn, Routes.usertypes_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create usertypes" do
    test "renders usertypes when data is valid", %{conn: conn} do
      conn = post(conn, Routes.usertypes_path(conn, :create), usertypes: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.usertypes_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.usertypes_path(conn, :create), usertypes: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update usertypes" do
    setup [:create_usertypes]

    test "renders usertypes when data is valid", %{conn: conn, usertypes: %Usertypes{id: id} = usertypes} do
      conn = put(conn, Routes.usertypes_path(conn, :update, usertypes), usertypes: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.usertypes_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, usertypes: usertypes} do
      conn = put(conn, Routes.usertypes_path(conn, :update, usertypes), usertypes: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete usertypes" do
    setup [:create_usertypes]

    test "deletes chosen usertypes", %{conn: conn, usertypes: usertypes} do
      conn = delete(conn, Routes.usertypes_path(conn, :delete, usertypes))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.usertypes_path(conn, :show, usertypes))
      end
    end
  end

  defp create_usertypes(_) do
    usertypes = fixture(:usertypes)
    %{usertypes: usertypes}
  end
end
