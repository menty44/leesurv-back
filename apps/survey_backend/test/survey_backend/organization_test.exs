defmodule SurveyBackend.OrganizationTest do
  use SurveyBackend.DataCase

  alias SurveyBackend.Organization

  describe "organization" do
    alias SurveyBackend.Organization.Organizations

    @valid_attrs %{businessname: "some businessname", email: "some email", imgurl: "some imgurl", website: "some website"}
    @update_attrs %{businessname: "some updated businessname", email: "some updated email", imgurl: "some updated imgurl", website: "some updated website"}
    @invalid_attrs %{businessname: nil, email: nil, imgurl: nil, website: nil}

    def organizations_fixture(attrs \\ %{}) do
      {:ok, organizations} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Organization.create_organizations()

      organizations
    end

    test "list_organization/0 returns all organization" do
      organizations = organizations_fixture()
      assert Organization.list_organization() == [organizations]
    end

    test "get_organizations!/1 returns the organizations with given id" do
      organizations = organizations_fixture()
      assert Organization.get_organizations!(organizations.id) == organizations
    end

    test "create_organizations/1 with valid data creates a organizations" do
      assert {:ok, %Organizations{} = organizations} = Organization.create_organizations(@valid_attrs)
      assert organizations.businessname == "some businessname"
      assert organizations.email == "some email"
      assert organizations.imgurl == "some imgurl"
      assert organizations.website == "some website"
    end

    test "create_organizations/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organization.create_organizations(@invalid_attrs)
    end

    test "update_organizations/2 with valid data updates the organizations" do
      organizations = organizations_fixture()
      assert {:ok, %Organizations{} = organizations} = Organization.update_organizations(organizations, @update_attrs)
      assert organizations.businessname == "some updated businessname"
      assert organizations.email == "some updated email"
      assert organizations.imgurl == "some updated imgurl"
      assert organizations.website == "some updated website"
    end

    test "update_organizations/2 with invalid data returns error changeset" do
      organizations = organizations_fixture()
      assert {:error, %Ecto.Changeset{}} = Organization.update_organizations(organizations, @invalid_attrs)
      assert organizations == Organization.get_organizations!(organizations.id)
    end

    test "delete_organizations/1 deletes the organizations" do
      organizations = organizations_fixture()
      assert {:ok, %Organizations{}} = Organization.delete_organizations(organizations)
      assert_raise Ecto.NoResultsError, fn -> Organization.get_organizations!(organizations.id) end
    end

    test "change_organizations/1 returns a organizations changeset" do
      organizations = organizations_fixture()
      assert %Ecto.Changeset{} = Organization.change_organizations(organizations)
    end
  end
end
