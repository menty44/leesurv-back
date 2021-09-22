defmodule SurveyBackendWeb.MenusView do
  use SurveyBackendWeb, :view
  alias SurveyBackendWeb.MenusView

  def render("index.json", %{menu: menu}) do
    %{data: render_many(menu, MenusView, "menus.json")}
  end

  def render("show.json", %{menus: menus}) do
    %{data: render_one(menus, MenusView, "menus.json")}
  end

  def render("menus.json", %{menus: menus}) do
    %{id: menus.id,
      name: menus.name,
      description: menus.description,
      active: menus.active}
  end
end
