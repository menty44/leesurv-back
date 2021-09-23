defmodule SurveyBackendWeb.UsertypesView do
  use SurveyBackendWeb, :view
  alias SurveyBackendWeb.UsertypesView

  def render("index.json", %{usertype: usertype}) do
    %{data: render_many(usertype, UsertypesView, "usertypes.json")}
  end

  def render("show.json", %{usertypes: usertypes}) do
    %{data: render_one(usertypes, UsertypesView, "usertypes.json")}
  end

  def render("usertypes.json", %{usertypes: usertypes}) do
    %{id: usertypes.id,
      name: usertypes.name}
  end
end
