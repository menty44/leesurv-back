defmodule SurveyBackendWeb.PermissionsView do
  use SurveyBackendWeb, :view
  alias SurveyBackendWeb.PermissionsView

  def render("index.json", %{permission: permission}) do
    %{data: render_many(permission, PermissionsView, "permissions.json")}
  end

  def render("show.json", %{permissions: permissions}) do
    %{data: render_one(permissions, PermissionsView, "permissions.json")}
  end

  def render("permissions.json", %{permissions: permissions}) do
    %{id: permissions.id,
      name: permissions.name,
      description: permissions.description}
  end
end
