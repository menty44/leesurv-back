defmodule SurveyBackendWeb.SmssView do
  use SurveyBackendWeb, :view
  alias SurveyBackendWeb.SmssView

  def render("index.json", %{sms: sms}) do
    %{data: render_many(sms, SmssView, "smss.json")}
  end

  def render("show.json", %{smss: smss}) do
    %{data: render_one(smss, SmssView, "smss.json")}
  end

  def render("smss.json", %{smss: smss}) do
    %{id: smss.id,
      phone: smss.phone,
      message: smss.message}
  end
end
