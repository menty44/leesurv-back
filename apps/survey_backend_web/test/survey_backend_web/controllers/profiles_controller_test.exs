defmodule SurveyBackendWeb.ProfilesControllerTest do
  use SurveyBackendWeb.ConnCase

  alias SurveyBackend.Usermanagement
  alias SurveyBackend.Usermanagement.Profiles

  @create_attrs %{
    country: "some country",
    dob: "some dob",
    image: "some image"
  }
  @update_attrs %{
    country: "some updated country",
    dob: "some updated dob",
    image: "some updated image"
  }
  @invalid_attrs %{country: nil, dob: nil, image: nil}

  def fixture(:profiles) do
    {:ok, profiles} = Usermanagement.create_profiles(@create_attrs)
    profiles
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all profile", %{conn: conn} do
      conn = get(conn, Routes.profiles_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create profiles" do
    test "renders profiles when data is valid", %{conn: conn} do
      conn = post(conn, Routes.profiles_path(conn, :create), profiles: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.profiles_path(conn, :show, id))

      assert %{
               "id" => id,
               "country" => "some country",
               "dob" => "some dob",
               "image" => "some image"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.profiles_path(conn, :create), profiles: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update profiles" do
    setup [:create_profiles]

    test "renders profiles when data is valid", %{conn: conn, profiles: %Profiles{id: id} = profiles} do
      conn = put(conn, Routes.profiles_path(conn, :update, profiles), profiles: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.profiles_path(conn, :show, id))

      assert %{
               "id" => id,
               "country" => "some updated country",
               "dob" => "some updated dob",
               "image" => "some updated image"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, profiles: profiles} do
      conn = put(conn, Routes.profiles_path(conn, :update, profiles), profiles: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete profiles" do
    setup [:create_profiles]

    test "deletes chosen profiles", %{conn: conn, profiles: profiles} do
      conn = delete(conn, Routes.profiles_path(conn, :delete, profiles))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.profiles_path(conn, :show, profiles))
      end
    end
  end

  defp create_profiles(_) do
    profiles = fixture(:profiles)
    %{profiles: profiles}
  end
end
