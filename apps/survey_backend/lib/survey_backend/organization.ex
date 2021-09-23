defmodule SurveyBackend.Organization do
  @moduledoc """
  The Organization context.
  """

  import Ecto.Query, warn: false
  alias SurveyBackend.Repo

  alias SurveyBackend.Organization.Organizations

  @doc """
  Returns the list of organization.

  ## Examples

      iex> list_organization()
      [%Organizations{}, ...]

  """
  def list_organization do
    Repo.all(Organizations)
  end

  @doc """
  Gets a single organizations.

  Raises `Ecto.NoResultsError` if the Organizations does not exist.

  ## Examples

      iex> get_organizations!(123)
      %Organizations{}

      iex> get_organizations!(456)
      ** (Ecto.NoResultsError)

  """
  def get_organizations!(id), do: Repo.get!(Organizations, id)

  @doc """
  Creates a organizations.

  ## Examples

      iex> create_organizations(%{field: value})
      {:ok, %Organizations{}}

      iex> create_organizations(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_organizations(attrs \\ %{}) do
    %Organizations{}
    |> Organizations.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a organizations.

  ## Examples

      iex> update_organizations(organizations, %{field: new_value})
      {:ok, %Organizations{}}

      iex> update_organizations(organizations, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_organizations(%Organizations{} = organizations, attrs) do
    organizations
    |> Organizations.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a organizations.

  ## Examples

      iex> delete_organizations(organizations)
      {:ok, %Organizations{}}

      iex> delete_organizations(organizations)
      {:error, %Ecto.Changeset{}}

  """
  def delete_organizations(%Organizations{} = organizations) do
    Repo.delete(organizations)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking organizations changes.

  ## Examples

      iex> change_organizations(organizations)
      %Ecto.Changeset{data: %Organizations{}}

  """
  def change_organizations(%Organizations{} = organizations, attrs \\ %{}) do
    Organizations.changeset(organizations, attrs)
  end
end
