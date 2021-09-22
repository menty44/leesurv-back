defmodule SurveyBackend.CountryTest do
  use SurveyBackend.DataCase

  alias SurveyBackend.Country

  describe "country" do
    alias SurveyBackend.Country.Countries

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def countries_fixture(attrs \\ %{}) do
      {:ok, countries} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Country.create_countries()

      countries
    end

    test "list_country/0 returns all country" do
      countries = countries_fixture()
      assert Country.list_country() == [countries]
    end

    test "get_countries!/1 returns the countries with given id" do
      countries = countries_fixture()
      assert Country.get_countries!(countries.id) == countries
    end

    test "create_countries/1 with valid data creates a countries" do
      assert {:ok, %Countries{} = countries} = Country.create_countries(@valid_attrs)
      assert countries.name == "some name"
    end

    test "create_countries/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Country.create_countries(@invalid_attrs)
    end

    test "update_countries/2 with valid data updates the countries" do
      countries = countries_fixture()
      assert {:ok, %Countries{} = countries} = Country.update_countries(countries, @update_attrs)
      assert countries.name == "some updated name"
    end

    test "update_countries/2 with invalid data returns error changeset" do
      countries = countries_fixture()
      assert {:error, %Ecto.Changeset{}} = Country.update_countries(countries, @invalid_attrs)
      assert countries == Country.get_countries!(countries.id)
    end

    test "delete_countries/1 deletes the countries" do
      countries = countries_fixture()
      assert {:ok, %Countries{}} = Country.delete_countries(countries)
      assert_raise Ecto.NoResultsError, fn -> Country.get_countries!(countries.id) end
    end

    test "change_countries/1 returns a countries changeset" do
      countries = countries_fixture()
      assert %Ecto.Changeset{} = Country.change_countries(countries)
    end
  end
end
