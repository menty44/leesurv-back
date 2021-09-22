defmodule SurveyBackendWeb.RolesView do
  use SurveyBackendWeb, :view
  alias SurveyBackendWeb.RolesView

  def render("index.json", %{role: role}) do
    %{data: render_many(role, RolesView, "roles.json")}
  end

  def render("show.json", %{roles: roles}) do
    %{data: render_one(roles, RolesView, "roles.json")}
  end

  def render("roles.json", %{roles: roles}) do
    %{id: roles.id,
      name: roles.name,
      description: roles.description}
  end
end
