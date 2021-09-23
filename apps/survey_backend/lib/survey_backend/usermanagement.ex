defmodule SurveyBackend.Usermanagement do
  @moduledoc """
  The Usermanagement context.
  """

  import Ecto.Query, warn: false
  alias SurveyBackend.Repo

  alias SurveyBackend.Usermanagement.Roles

  @doc """
  Returns the list of role.

  ## Examples

      iex> list_role()
      [%Roles{}, ...]

  """
  def list_role do
    Repo.all(Roles)
  end

  @doc """
  Gets a single roles.

  Raises `Ecto.NoResultsError` if the Roles does not exist.

  ## Examples

      iex> get_roles!(123)
      %Roles{}

      iex> get_roles!(456)
      ** (Ecto.NoResultsError)

  """
  def get_roles!(id), do: Repo.get!(Roles, id)

  @doc """
  Creates a roles.

  ## Examples

      iex> create_roles(%{field: value})
      {:ok, %Roles{}}

      iex> create_roles(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_roles(attrs \\ %{}) do
    %Roles{}
    |> Roles.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a roles.

  ## Examples

      iex> update_roles(roles, %{field: new_value})
      {:ok, %Roles{}}

      iex> update_roles(roles, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_roles(%Roles{} = roles, attrs) do
    roles
    |> Roles.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a roles.

  ## Examples

      iex> delete_roles(roles)
      {:ok, %Roles{}}

      iex> delete_roles(roles)
      {:error, %Ecto.Changeset{}}

  """
  def delete_roles(%Roles{} = roles) do
    Repo.delete(roles)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking roles changes.

  ## Examples

      iex> change_roles(roles)
      %Ecto.Changeset{data: %Roles{}}

  """
  def change_roles(%Roles{} = roles, attrs \\ %{}) do
    Roles.changeset(roles, attrs)
  end

  alias SurveyBackend.Usermanagement.Permissions

  @doc """
  Returns the list of permission.

  ## Examples

      iex> list_permission()
      [%Permissions{}, ...]

  """
  def list_permission do
    Repo.all(Permissions)
  end

  @doc """
  Gets a single permissions.

  Raises `Ecto.NoResultsError` if the Permissions does not exist.

  ## Examples

      iex> get_permissions!(123)
      %Permissions{}

      iex> get_permissions!(456)
      ** (Ecto.NoResultsError)

  """
  def get_permissions!(id), do: Repo.get!(Permissions, id)

  @doc """
  Creates a permissions.

  ## Examples

      iex> create_permissions(%{field: value})
      {:ok, %Permissions{}}

      iex> create_permissions(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_permissions(attrs \\ %{}) do
    %Permissions{}
    |> Permissions.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a permissions.

  ## Examples

      iex> update_permissions(permissions, %{field: new_value})
      {:ok, %Permissions{}}

      iex> update_permissions(permissions, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_permissions(%Permissions{} = permissions, attrs) do
    permissions
    |> Permissions.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a permissions.

  ## Examples

      iex> delete_permissions(permissions)
      {:ok, %Permissions{}}

      iex> delete_permissions(permissions)
      {:error, %Ecto.Changeset{}}

  """
  def delete_permissions(%Permissions{} = permissions) do
    Repo.delete(permissions)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking permissions changes.

  ## Examples

      iex> change_permissions(permissions)
      %Ecto.Changeset{data: %Permissions{}}

  """
  def change_permissions(%Permissions{} = permissions, attrs \\ %{}) do
    Permissions.changeset(permissions, attrs)
  end

  alias SurveyBackend.Usermanagement.Activations

  @doc """
  Returns the list of activation.

  ## Examples

      iex> list_activation()
      [%Activations{}, ...]

  """
  def list_activation do
    Repo.all(Activations)
  end

  @doc """
  Gets a single activations.

  Raises `Ecto.NoResultsError` if the Activations does not exist.

  ## Examples

      iex> get_activations!(123)
      %Activations{}

      iex> get_activations!(456)
      ** (Ecto.NoResultsError)

  """
  def get_activations!(id), do: Repo.get!(Activations, id)

  @doc """
  Creates a activations.

  ## Examples

      iex> create_activations(%{field: value})
      {:ok, %Activations{}}

      iex> create_activations(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_activations(attrs \\ %{}) do
    %Activations{}
    |> Activations.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a activations.

  ## Examples

      iex> update_activations(activations, %{field: new_value})
      {:ok, %Activations{}}

      iex> update_activations(activations, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_activations(%Activations{} = activations, attrs) do
    activations
    |> Activations.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a activations.

  ## Examples

      iex> delete_activations(activations)
      {:ok, %Activations{}}

      iex> delete_activations(activations)
      {:error, %Ecto.Changeset{}}

  """
  def delete_activations(%Activations{} = activations) do
    Repo.delete(activations)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking activations changes.

  ## Examples

      iex> change_activations(activations)
      %Ecto.Changeset{data: %Activations{}}

  """
  def change_activations(%Activations{} = activations, attrs \\ %{}) do
    Activations.changeset(activations, attrs)
  end

  alias SurveyBackend.Usermanagement.Account

  @doc """
  Returns the list of account.

  ## Examples

      iex> list_account()
      [%Account{}, ...]

  """
  def list_account do
    Repo.all(Account)
  end

  @doc """
  Gets a single account.

  Raises `Ecto.NoResultsError` if the Account does not exist.

  ## Examples

      iex> get_account!(123)
      %Account{}

      iex> get_account!(456)
      ** (Ecto.NoResultsError)

  """
  def get_account!(id), do: Repo.get!(Account, id)

  @doc """
  Creates a account.

  ## Examples

      iex> create_account(%{field: value})
      {:ok, %Account{}}

      iex> create_account(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_account(attrs \\ %{}) do
    %Account{}
    |> Account.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a account.

  ## Examples

      iex> update_account(account, %{field: new_value})
      {:ok, %Account{}}

      iex> update_account(account, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_account(%Account{} = account, attrs) do
    account
    |> Account.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a account.

  ## Examples

      iex> delete_account(account)
      {:ok, %Account{}}

      iex> delete_account(account)
      {:error, %Ecto.Changeset{}}

  """
  def delete_account(%Account{} = account) do
    Repo.delete(account)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking account changes.

  ## Examples

      iex> change_account(account)
      %Ecto.Changeset{data: %Account{}}

  """
  def change_account(%Account{} = account, attrs \\ %{}) do
    Account.changeset(account, attrs)
  end

  alias SurveyBackend.Usermanagement.Users

  @doc """
  Returns the list of user.

  ## Examples

      iex> list_user()
      [%Users{}, ...]

  """
  def list_user do
    Repo.all(Users)
  end

  @doc """
  Gets a single users.

  Raises `Ecto.NoResultsError` if the Users does not exist.

  ## Examples

      iex> get_users!(123)
      %Users{}

      iex> get_users!(456)
      ** (Ecto.NoResultsError)

  """
  def get_users!(id), do: Repo.get!(Users, id)

  @doc """
  Creates a users.

  ## Examples

      iex> create_users(%{field: value})
      {:ok, %Users{}}

      iex> create_users(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_users(attrs \\ %{}) do
    %Users{}
    |> Users.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a users.

  ## Examples

      iex> update_users(users, %{field: new_value})
      {:ok, %Users{}}

      iex> update_users(users, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_users(%Users{} = users, attrs) do
    users
    |> Users.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a users.

  ## Examples

      iex> delete_users(users)
      {:ok, %Users{}}

      iex> delete_users(users)
      {:error, %Ecto.Changeset{}}

  """
  def delete_users(%Users{} = users) do
    Repo.delete(users)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking users changes.

  ## Examples

      iex> change_users(users)
      %Ecto.Changeset{data: %Users{}}

  """
  def change_users(%Users{} = users, attrs \\ %{}) do
    Users.changeset(users, attrs)
  end

  alias SurveyBackend.Usermanagement.Profiles

  @doc """
  Returns the list of profile.

  ## Examples

      iex> list_profile()
      [%Profiles{}, ...]

  """
  def list_profile do
    Repo.all(Profiles)
  end

  @doc """
  Gets a single profiles.

  Raises `Ecto.NoResultsError` if the Profiles does not exist.

  ## Examples

      iex> get_profiles!(123)
      %Profiles{}

      iex> get_profiles!(456)
      ** (Ecto.NoResultsError)

  """
  def get_profiles!(id), do: Repo.get!(Profiles, id)

  @doc """
  Creates a profiles.

  ## Examples

      iex> create_profiles(%{field: value})
      {:ok, %Profiles{}}

      iex> create_profiles(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_profiles(attrs \\ %{}) do
    %Profiles{}
    |> Profiles.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a profiles.

  ## Examples

      iex> update_profiles(profiles, %{field: new_value})
      {:ok, %Profiles{}}

      iex> update_profiles(profiles, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_profiles(%Profiles{} = profiles, attrs) do
    profiles
    |> Profiles.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a profiles.

  ## Examples

      iex> delete_profiles(profiles)
      {:ok, %Profiles{}}

      iex> delete_profiles(profiles)
      {:error, %Ecto.Changeset{}}

  """
  def delete_profiles(%Profiles{} = profiles) do
    Repo.delete(profiles)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking profiles changes.

  ## Examples

      iex> change_profiles(profiles)
      %Ecto.Changeset{data: %Profiles{}}

  """
  def change_profiles(%Profiles{} = profiles, attrs \\ %{}) do
    Profiles.changeset(profiles, attrs)
  end

  alias SurveyBackend.Usermanagement.Menus

  @doc """
  Returns the list of menu.

  ## Examples

      iex> list_menu()
      [%Menus{}, ...]

  """
  def list_menu do
    Repo.all(Menus)
  end

  @doc """
  Gets a single menus.

  Raises `Ecto.NoResultsError` if the Menus does not exist.

  ## Examples

      iex> get_menus!(123)
      %Menus{}

      iex> get_menus!(456)
      ** (Ecto.NoResultsError)

  """
  def get_menus!(id), do: Repo.get!(Menus, id)

  @doc """
  Creates a menus.

  ## Examples

      iex> create_menus(%{field: value})
      {:ok, %Menus{}}

      iex> create_menus(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_menus(attrs \\ %{}) do
    %Menus{}
    |> Menus.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a menus.

  ## Examples

      iex> update_menus(menus, %{field: new_value})
      {:ok, %Menus{}}

      iex> update_menus(menus, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_menus(%Menus{} = menus, attrs) do
    menus
    |> Menus.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a menus.

  ## Examples

      iex> delete_menus(menus)
      {:ok, %Menus{}}

      iex> delete_menus(menus)
      {:error, %Ecto.Changeset{}}

  """
  def delete_menus(%Menus{} = menus) do
    Repo.delete(menus)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking menus changes.

  ## Examples

      iex> change_menus(menus)
      %Ecto.Changeset{data: %Menus{}}

  """
  def change_menus(%Menus{} = menus, attrs \\ %{}) do
    Menus.changeset(menus, attrs)
  end

  alias SurveyBackend.Usermanagement.Usertypes

  @doc """
  Returns the list of usertype.

  ## Examples

      iex> list_usertype()
      [%Usertypes{}, ...]

  """
  def list_usertype do
    Repo.all(Usertypes)
  end

  @doc """
  Gets a single usertypes.

  Raises `Ecto.NoResultsError` if the Usertypes does not exist.

  ## Examples

      iex> get_usertypes!(123)
      %Usertypes{}

      iex> get_usertypes!(456)
      ** (Ecto.NoResultsError)

  """
  def get_usertypes!(id), do: Repo.get!(Usertypes, id)

  @doc """
  Creates a usertypes.

  ## Examples

      iex> create_usertypes(%{field: value})
      {:ok, %Usertypes{}}

      iex> create_usertypes(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_usertypes(attrs \\ %{}) do
    %Usertypes{}
    |> Usertypes.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a usertypes.

  ## Examples

      iex> update_usertypes(usertypes, %{field: new_value})
      {:ok, %Usertypes{}}

      iex> update_usertypes(usertypes, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_usertypes(%Usertypes{} = usertypes, attrs) do
    usertypes
    |> Usertypes.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a usertypes.

  ## Examples

      iex> delete_usertypes(usertypes)
      {:ok, %Usertypes{}}

      iex> delete_usertypes(usertypes)
      {:error, %Ecto.Changeset{}}

  """
  def delete_usertypes(%Usertypes{} = usertypes) do
    Repo.delete(usertypes)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking usertypes changes.

  ## Examples

      iex> change_usertypes(usertypes)
      %Ecto.Changeset{data: %Usertypes{}}

  """
  def change_usertypes(%Usertypes{} = usertypes, attrs \\ %{}) do
    Usertypes.changeset(usertypes, attrs)
  end

  alias SurveyBackend.Usermanagement.Userroles

  @doc """
  Returns the list of userrole.

  ## Examples

      iex> list_userrole()
      [%Userroles{}, ...]

  """
  def list_userrole do
    Repo.all(Userroles)
  end

  @doc """
  Gets a single userroles.

  Raises `Ecto.NoResultsError` if the Userroles does not exist.

  ## Examples

      iex> get_userroles!(123)
      %Userroles{}

      iex> get_userroles!(456)
      ** (Ecto.NoResultsError)

  """
  def get_userroles!(id), do: Repo.get!(Userroles, id)

  @doc """
  Creates a userroles.

  ## Examples

      iex> create_userroles(%{field: value})
      {:ok, %Userroles{}}

      iex> create_userroles(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_userroles(attrs \\ %{}) do
    %Userroles{}
    |> Userroles.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a userroles.

  ## Examples

      iex> update_userroles(userroles, %{field: new_value})
      {:ok, %Userroles{}}

      iex> update_userroles(userroles, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_userroles(%Userroles{} = userroles, attrs) do
    userroles
    |> Userroles.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a userroles.

  ## Examples

      iex> delete_userroles(userroles)
      {:ok, %Userroles{}}

      iex> delete_userroles(userroles)
      {:error, %Ecto.Changeset{}}

  """
  def delete_userroles(%Userroles{} = userroles) do
    Repo.delete(userroles)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking userroles changes.

  ## Examples

      iex> change_userroles(userroles)
      %Ecto.Changeset{data: %Userroles{}}

  """
  def change_userroles(%Userroles{} = userroles, attrs \\ %{}) do
    Userroles.changeset(userroles, attrs)
  end
end
