defmodule SurveyBackendWeb.CountriesController do
  use SurveyBackendWeb, :controller

  alias SurveyBackend.Country
  alias SurveyBackend.Country.Countries

  action_fallback SurveyBackendWeb.FallbackController

  def index(conn, _params) do
    country = Country.list_country()
    render(conn, "index.json", country: country)
  end

  def create(conn, %{"countries" => countries_params}) do
    with {:ok, %Countries{} = countries} <- Country.create_countries(countries_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.countries_path(conn, :show, countries))
      |> render("show.json", countries: countries)
    end
  end

  def show(conn, %{"id" => id}) do
    countries = Country.get_countries!(id)
    render(conn, "show.json", countries: countries)
  end

  def update(conn, %{"id" => id, "countries" => countries_params}) do
    countries = Country.get_countries!(id)

    with {:ok, %Countries{} = countries} <- Country.update_countries(countries, countries_params) do
      render(conn, "show.json", countries: countries)
    end
  end

  def delete(conn, %{"id" => id}) do
    countries = Country.get_countries!(id)

    with {:ok, %Countries{}} <- Country.delete_countries(countries) do
      send_resp(conn, :no_content, "")
    end
  end
end
