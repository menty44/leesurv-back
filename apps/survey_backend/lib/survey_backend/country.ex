defmodule SurveyBackend.Country do
  @moduledoc """
  The Country context.
  """

  import Ecto.Query, warn: false
  alias SurveyBackend.Repo

  alias SurveyBackend.Country.Countries

  @doc """
  Returns the list of country.

  ## Examples

      iex> list_country()
      [%Countries{}, ...]

  """
  def list_country do
    Repo.all(Countries)
  end

  @doc """
  Gets a single countries.

  Raises `Ecto.NoResultsError` if the Countries does not exist.

  ## Examples

      iex> get_countries!(123)
      %Countries{}

      iex> get_countries!(456)
      ** (Ecto.NoResultsError)

  """
  def get_countries!(id), do: Repo.get!(Countries, id)

  @doc """
  Creates a countries.

  ## Examples

      iex> create_countries(%{field: value})
      {:ok, %Countries{}}

      iex> create_countries(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_countries(attrs \\ %{}) do
    %Countries{}
    |> Countries.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a countries.

  ## Examples

      iex> update_countries(countries, %{field: new_value})
      {:ok, %Countries{}}

      iex> update_countries(countries, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_countries(%Countries{} = countries, attrs) do
    countries
    |> Countries.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a countries.

  ## Examples

      iex> delete_countries(countries)
      {:ok, %Countries{}}

      iex> delete_countries(countries)
      {:error, %Ecto.Changeset{}}

  """
  def delete_countries(%Countries{} = countries) do
    Repo.delete(countries)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking countries changes.

  ## Examples

      iex> change_countries(countries)
      %Ecto.Changeset{data: %Countries{}}

  """
  def change_countries(%Countries{} = countries, attrs \\ %{}) do
    Countries.changeset(countries, attrs)
  end
end
