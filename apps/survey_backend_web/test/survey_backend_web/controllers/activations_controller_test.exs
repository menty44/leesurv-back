defmodule SurveyBackendWeb.ActivationsControllerTest do
  use SurveyBackendWeb.ConnCase

  alias SurveyBackend.Usermanagement
  alias SurveyBackend.Usermanagement.Activations

  @create_attrs %{
    clicked: true,
    code: "some code",
    email: "some email"
  }
  @update_attrs %{
    clicked: false,
    code: "some updated code",
    email: "some updated email"
  }
  @invalid_attrs %{clicked: nil, code: nil, email: nil}

  def fixture(:activations) do
    {:ok, activations} = Usermanagement.create_activations(@create_attrs)
    activations
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all activation", %{conn: conn} do
      conn = get(conn, Routes.activations_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create activations" do
    test "renders activations when data is valid", %{conn: conn} do
      conn = post(conn, Routes.activations_path(conn, :create), activations: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.activations_path(conn, :show, id))

      assert %{
               "id" => id,
               "clicked" => true,
               "code" => "some code",
               "email" => "some email"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.activations_path(conn, :create), activations: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update activations" do
    setup [:create_activations]

    test "renders activations when data is valid", %{conn: conn, activations: %Activations{id: id} = activations} do
      conn = put(conn, Routes.activations_path(conn, :update, activations), activations: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.activations_path(conn, :show, id))

      assert %{
               "id" => id,
               "clicked" => false,
               "code" => "some updated code",
               "email" => "some updated email"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, activations: activations} do
      conn = put(conn, Routes.activations_path(conn, :update, activations), activations: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete activations" do
    setup [:create_activations]

    test "deletes chosen activations", %{conn: conn, activations: activations} do
      conn = delete(conn, Routes.activations_path(conn, :delete, activations))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.activations_path(conn, :show, activations))
      end
    end
  end

  defp create_activations(_) do
    activations = fixture(:activations)
    %{activations: activations}
  end
end
