defmodule SurveyBackendWeb.ProfilesView do
  use SurveyBackendWeb, :view
  alias SurveyBackendWeb.ProfilesView

  def render("index.json", %{profile: profile}) do
    %{data: render_many(profile, ProfilesView, "profiles.json")}
  end

  def render("show.json", %{profiles: profiles}) do
    %{data: render_one(profiles, ProfilesView, "profiles.json")}
  end

  def render("profiles.json", %{profiles: profiles}) do
    %{id: profiles.id,
      image: profiles.image,
      dob: profiles.dob,
      country: profiles.country}
  end
end
