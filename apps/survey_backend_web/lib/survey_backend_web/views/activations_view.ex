defmodule SurveyBackendWeb.ActivationsView do
  use SurveyBackendWeb, :view
  alias SurveyBackendWeb.ActivationsView

  def render("index.json", %{activation: activation}) do
    %{data: render_many(activation, ActivationsView, "activations.json")}
  end

  def render("show.json", %{activations: activations}) do
    %{data: render_one(activations, ActivationsView, "activations.json")}
  end

  def render("activations.json", %{activations: activations}) do
    %{id: activations.id,
      email: activations.email,
      code: activations.code,
      clicked: activations.clicked}
  end
end
