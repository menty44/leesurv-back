defmodule SurveyBackendWeb.CountriesView do
  use SurveyBackendWeb, :view
  alias SurveyBackendWeb.CountriesView

  def render("index.json", %{country: country}) do
    %{data: render_many(country, CountriesView, "countries.json")}
  end

  def render("show.json", %{countries: countries}) do
    %{data: render_one(countries, CountriesView, "countries.json")}
  end

  def render("countries.json", %{countries: countries}) do
    %{id: countries.id,
      name: countries.name}
  end
end
