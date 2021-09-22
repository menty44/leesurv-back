defmodule SurveyBackend.UsermanagementTest do
  use SurveyBackend.DataCase

  alias SurveyBackend.Usermanagement

  describe "role" do
    alias SurveyBackend.Usermanagement.Roles

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def roles_fixture(attrs \\ %{}) do
      {:ok, roles} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Usermanagement.create_roles()

      roles
    end

    test "list_role/0 returns all role" do
      roles = roles_fixture()
      assert Usermanagement.list_role() == [roles]
    end

    test "get_roles!/1 returns the roles with given id" do
      roles = roles_fixture()
      assert Usermanagement.get_roles!(roles.id) == roles
    end

    test "create_roles/1 with valid data creates a roles" do
      assert {:ok, %Roles{} = roles} = Usermanagement.create_roles(@valid_attrs)
      assert roles.description == "some description"
      assert roles.name == "some name"
    end

    test "create_roles/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usermanagement.create_roles(@invalid_attrs)
    end

    test "update_roles/2 with valid data updates the roles" do
      roles = roles_fixture()
      assert {:ok, %Roles{} = roles} = Usermanagement.update_roles(roles, @update_attrs)
      assert roles.description == "some updated description"
      assert roles.name == "some updated name"
    end

    test "update_roles/2 with invalid data returns error changeset" do
      roles = roles_fixture()
      assert {:error, %Ecto.Changeset{}} = Usermanagement.update_roles(roles, @invalid_attrs)
      assert roles == Usermanagement.get_roles!(roles.id)
    end

    test "delete_roles/1 deletes the roles" do
      roles = roles_fixture()
      assert {:ok, %Roles{}} = Usermanagement.delete_roles(roles)
      assert_raise Ecto.NoResultsError, fn -> Usermanagement.get_roles!(roles.id) end
    end

    test "change_roles/1 returns a roles changeset" do
      roles = roles_fixture()
      assert %Ecto.Changeset{} = Usermanagement.change_roles(roles)
    end
  end

  describe "permission" do
    alias SurveyBackend.Usermanagement.Permissions

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def permissions_fixture(attrs \\ %{}) do
      {:ok, permissions} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Usermanagement.create_permissions()

      permissions
    end

    test "list_permission/0 returns all permission" do
      permissions = permissions_fixture()
      assert Usermanagement.list_permission() == [permissions]
    end

    test "get_permissions!/1 returns the permissions with given id" do
      permissions = permissions_fixture()
      assert Usermanagement.get_permissions!(permissions.id) == permissions
    end

    test "create_permissions/1 with valid data creates a permissions" do
      assert {:ok, %Permissions{} = permissions} = Usermanagement.create_permissions(@valid_attrs)
      assert permissions.description == "some description"
      assert permissions.name == "some name"
    end

    test "create_permissions/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usermanagement.create_permissions(@invalid_attrs)
    end

    test "update_permissions/2 with valid data updates the permissions" do
      permissions = permissions_fixture()
      assert {:ok, %Permissions{} = permissions} = Usermanagement.update_permissions(permissions, @update_attrs)
      assert permissions.description == "some updated description"
      assert permissions.name == "some updated name"
    end

    test "update_permissions/2 with invalid data returns error changeset" do
      permissions = permissions_fixture()
      assert {:error, %Ecto.Changeset{}} = Usermanagement.update_permissions(permissions, @invalid_attrs)
      assert permissions == Usermanagement.get_permissions!(permissions.id)
    end

    test "delete_permissions/1 deletes the permissions" do
      permissions = permissions_fixture()
      assert {:ok, %Permissions{}} = Usermanagement.delete_permissions(permissions)
      assert_raise Ecto.NoResultsError, fn -> Usermanagement.get_permissions!(permissions.id) end
    end

    test "change_permissions/1 returns a permissions changeset" do
      permissions = permissions_fixture()
      assert %Ecto.Changeset{} = Usermanagement.change_permissions(permissions)
    end
  end

  describe "activation" do
    alias SurveyBackend.Usermanagement.Activations

    @valid_attrs %{clicked: true, code: "some code", email: "some email"}
    @update_attrs %{clicked: false, code: "some updated code", email: "some updated email"}
    @invalid_attrs %{clicked: nil, code: nil, email: nil}

    def activations_fixture(attrs \\ %{}) do
      {:ok, activations} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Usermanagement.create_activations()

      activations
    end

    test "list_activation/0 returns all activation" do
      activations = activations_fixture()
      assert Usermanagement.list_activation() == [activations]
    end

    test "get_activations!/1 returns the activations with given id" do
      activations = activations_fixture()
      assert Usermanagement.get_activations!(activations.id) == activations
    end

    test "create_activations/1 with valid data creates a activations" do
      assert {:ok, %Activations{} = activations} = Usermanagement.create_activations(@valid_attrs)
      assert activations.clicked == true
      assert activations.code == "some code"
      assert activations.email == "some email"
    end

    test "create_activations/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usermanagement.create_activations(@invalid_attrs)
    end

    test "update_activations/2 with valid data updates the activations" do
      activations = activations_fixture()
      assert {:ok, %Activations{} = activations} = Usermanagement.update_activations(activations, @update_attrs)
      assert activations.clicked == false
      assert activations.code == "some updated code"
      assert activations.email == "some updated email"
    end

    test "update_activations/2 with invalid data returns error changeset" do
      activations = activations_fixture()
      assert {:error, %Ecto.Changeset{}} = Usermanagement.update_activations(activations, @invalid_attrs)
      assert activations == Usermanagement.get_activations!(activations.id)
    end

    test "delete_activations/1 deletes the activations" do
      activations = activations_fixture()
      assert {:ok, %Activations{}} = Usermanagement.delete_activations(activations)
      assert_raise Ecto.NoResultsError, fn -> Usermanagement.get_activations!(activations.id) end
    end

    test "change_activations/1 returns a activations changeset" do
      activations = activations_fixture()
      assert %Ecto.Changeset{} = Usermanagement.change_activations(activations)
    end
  end

  describe "account" do
    alias SurveyBackend.Usermanagement.Account

    @valid_attrs %{code: "some code"}
    @update_attrs %{code: "some updated code"}
    @invalid_attrs %{code: nil}

    def account_fixture(attrs \\ %{}) do
      {:ok, account} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Usermanagement.create_account()

      account
    end

    test "list_account/0 returns all account" do
      account = account_fixture()
      assert Usermanagement.list_account() == [account]
    end

    test "get_account!/1 returns the account with given id" do
      account = account_fixture()
      assert Usermanagement.get_account!(account.id) == account
    end

    test "create_account/1 with valid data creates a account" do
      assert {:ok, %Account{} = account} = Usermanagement.create_account(@valid_attrs)
      assert account.code == "some code"
    end

    test "create_account/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usermanagement.create_account(@invalid_attrs)
    end

    test "update_account/2 with valid data updates the account" do
      account = account_fixture()
      assert {:ok, %Account{} = account} = Usermanagement.update_account(account, @update_attrs)
      assert account.code == "some updated code"
    end

    test "update_account/2 with invalid data returns error changeset" do
      account = account_fixture()
      assert {:error, %Ecto.Changeset{}} = Usermanagement.update_account(account, @invalid_attrs)
      assert account == Usermanagement.get_account!(account.id)
    end

    test "delete_account/1 deletes the account" do
      account = account_fixture()
      assert {:ok, %Account{}} = Usermanagement.delete_account(account)
      assert_raise Ecto.NoResultsError, fn -> Usermanagement.get_account!(account.id) end
    end

    test "change_account/1 returns a account changeset" do
      account = account_fixture()
      assert %Ecto.Changeset{} = Usermanagement.change_account(account)
    end
  end

  describe "user" do
    alias SurveyBackend.Usermanagement.Users

    @valid_attrs %{email: "some email", firstname: "some firstname", gender: "some gender", lastname: "some lastname", phone: "some phone", status: true, verified: "some verified"}
    @update_attrs %{email: "some updated email", firstname: "some updated firstname", gender: "some updated gender", lastname: "some updated lastname", phone: "some updated phone", status: false, verified: "some updated verified"}
    @invalid_attrs %{email: nil, firstname: nil, gender: nil, lastname: nil, phone: nil, status: nil, verified: nil}

    def users_fixture(attrs \\ %{}) do
      {:ok, users} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Usermanagement.create_users()

      users
    end

    test "list_user/0 returns all user" do
      users = users_fixture()
      assert Usermanagement.list_user() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert Usermanagement.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      assert {:ok, %Users{} = users} = Usermanagement.create_users(@valid_attrs)
      assert users.email == "some email"
      assert users.firstname == "some firstname"
      assert users.gender == "some gender"
      assert users.lastname == "some lastname"
      assert users.phone == "some phone"
      assert users.status == true
      assert users.verified == "some verified"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usermanagement.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      assert {:ok, %Users{} = users} = Usermanagement.update_users(users, @update_attrs)
      assert users.email == "some updated email"
      assert users.firstname == "some updated firstname"
      assert users.gender == "some updated gender"
      assert users.lastname == "some updated lastname"
      assert users.phone == "some updated phone"
      assert users.status == false
      assert users.verified == "some updated verified"
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = Usermanagement.update_users(users, @invalid_attrs)
      assert users == Usermanagement.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = Usermanagement.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> Usermanagement.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = Usermanagement.change_users(users)
    end
  end

  describe "profile" do
    alias SurveyBackend.Usermanagement.Profiles

    @valid_attrs %{country: "some country", dob: "some dob", image: "some image"}
    @update_attrs %{country: "some updated country", dob: "some updated dob", image: "some updated image"}
    @invalid_attrs %{country: nil, dob: nil, image: nil}

    def profiles_fixture(attrs \\ %{}) do
      {:ok, profiles} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Usermanagement.create_profiles()

      profiles
    end

    test "list_profile/0 returns all profile" do
      profiles = profiles_fixture()
      assert Usermanagement.list_profile() == [profiles]
    end

    test "get_profiles!/1 returns the profiles with given id" do
      profiles = profiles_fixture()
      assert Usermanagement.get_profiles!(profiles.id) == profiles
    end

    test "create_profiles/1 with valid data creates a profiles" do
      assert {:ok, %Profiles{} = profiles} = Usermanagement.create_profiles(@valid_attrs)
      assert profiles.country == "some country"
      assert profiles.dob == "some dob"
      assert profiles.image == "some image"
    end

    test "create_profiles/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usermanagement.create_profiles(@invalid_attrs)
    end

    test "update_profiles/2 with valid data updates the profiles" do
      profiles = profiles_fixture()
      assert {:ok, %Profiles{} = profiles} = Usermanagement.update_profiles(profiles, @update_attrs)
      assert profiles.country == "some updated country"
      assert profiles.dob == "some updated dob"
      assert profiles.image == "some updated image"
    end

    test "update_profiles/2 with invalid data returns error changeset" do
      profiles = profiles_fixture()
      assert {:error, %Ecto.Changeset{}} = Usermanagement.update_profiles(profiles, @invalid_attrs)
      assert profiles == Usermanagement.get_profiles!(profiles.id)
    end

    test "delete_profiles/1 deletes the profiles" do
      profiles = profiles_fixture()
      assert {:ok, %Profiles{}} = Usermanagement.delete_profiles(profiles)
      assert_raise Ecto.NoResultsError, fn -> Usermanagement.get_profiles!(profiles.id) end
    end

    test "change_profiles/1 returns a profiles changeset" do
      profiles = profiles_fixture()
      assert %Ecto.Changeset{} = Usermanagement.change_profiles(profiles)
    end
  end

  describe "menu" do
    alias SurveyBackend.Usermanagement.Menus

    @valid_attrs %{active: true, description: "some description", name: "some name"}
    @update_attrs %{active: false, description: "some updated description", name: "some updated name"}
    @invalid_attrs %{active: nil, description: nil, name: nil}

    def menus_fixture(attrs \\ %{}) do
      {:ok, menus} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Usermanagement.create_menus()

      menus
    end

    test "list_menu/0 returns all menu" do
      menus = menus_fixture()
      assert Usermanagement.list_menu() == [menus]
    end

    test "get_menus!/1 returns the menus with given id" do
      menus = menus_fixture()
      assert Usermanagement.get_menus!(menus.id) == menus
    end

    test "create_menus/1 with valid data creates a menus" do
      assert {:ok, %Menus{} = menus} = Usermanagement.create_menus(@valid_attrs)
      assert menus.active == true
      assert menus.description == "some description"
      assert menus.name == "some name"
    end

    test "create_menus/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Usermanagement.create_menus(@invalid_attrs)
    end

    test "update_menus/2 with valid data updates the menus" do
      menus = menus_fixture()
      assert {:ok, %Menus{} = menus} = Usermanagement.update_menus(menus, @update_attrs)
      assert menus.active == false
      assert menus.description == "some updated description"
      assert menus.name == "some updated name"
    end

    test "update_menus/2 with invalid data returns error changeset" do
      menus = menus_fixture()
      assert {:error, %Ecto.Changeset{}} = Usermanagement.update_menus(menus, @invalid_attrs)
      assert menus == Usermanagement.get_menus!(menus.id)
    end

    test "delete_menus/1 deletes the menus" do
      menus = menus_fixture()
      assert {:ok, %Menus{}} = Usermanagement.delete_menus(menus)
      assert_raise Ecto.NoResultsError, fn -> Usermanagement.get_menus!(menus.id) end
    end

    test "change_menus/1 returns a menus changeset" do
      menus = menus_fixture()
      assert %Ecto.Changeset{} = Usermanagement.change_menus(menus)
    end
  end
end
