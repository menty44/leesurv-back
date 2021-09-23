defmodule SurveyBackendWeb.UserrolesView do
  use SurveyBackendWeb, :view
  alias SurveyBackendWeb.UserrolesView

  def render("index.json", %{userrole: userrole}) do
    %{data: render_many(userrole, UserrolesView, "userroles.json")}
  end

  def render("show.json", %{userroles: userroles}) do
    %{data: render_one(userroles, UserrolesView, "userroles.json")}
  end

  def render("userroles.json", %{userroles: userroles}) do
    %{id: userroles.id,
      name: userroles.name}
  end
end
