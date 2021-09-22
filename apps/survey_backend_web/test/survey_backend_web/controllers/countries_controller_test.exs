defmodule SurveyBackendWeb.CountriesControllerTest do
  use SurveyBackendWeb.ConnCase

  alias SurveyBackend.Country
  alias SurveyBackend.Country.Countries

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:countries) do
    {:ok, countries} = Country.create_countries(@create_attrs)
    countries
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all country", %{conn: conn} do
      conn = get(conn, Routes.countries_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create countries" do
    test "renders countries when data is valid", %{conn: conn} do
      conn = post(conn, Routes.countries_path(conn, :create), countries: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.countries_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.countries_path(conn, :create), countries: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update countries" do
    setup [:create_countries]

    test "renders countries when data is valid", %{conn: conn, countries: %Countries{id: id} = countries} do
      conn = put(conn, Routes.countries_path(conn, :update, countries), countries: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.countries_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, countries: countries} do
      conn = put(conn, Routes.countries_path(conn, :update, countries), countries: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete countries" do
    setup [:create_countries]

    test "deletes chosen countries", %{conn: conn, countries: countries} do
      conn = delete(conn, Routes.countries_path(conn, :delete, countries))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.countries_path(conn, :show, countries))
      end
    end
  end

  defp create_countries(_) do
    countries = fixture(:countries)
    %{countries: countries}
  end
end
