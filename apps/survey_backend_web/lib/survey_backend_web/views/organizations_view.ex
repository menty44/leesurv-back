defmodule SurveyBackendWeb.OrganizationsView do
  use SurveyBackendWeb, :view
  alias SurveyBackendWeb.OrganizationsView

  def render("index.json", %{organization: organization}) do
    %{data: render_many(organization, OrganizationsView, "organizations.json")}
  end

  def render("show.json", %{organizations: organizations}) do
    %{data: render_one(organizations, OrganizationsView, "organizations.json")}
  end

  def render("organizations.json", %{organizations: organizations}) do
    %{id: organizations.id,
      businessname: organizations.businessname,
      email: organizations.email,
      website: organizations.website,
      imgurl: organizations.imgurl}
  end
end
