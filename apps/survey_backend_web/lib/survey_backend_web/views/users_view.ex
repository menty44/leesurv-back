defmodule SurveyBackendWeb.UsersView do
  use SurveyBackendWeb, :view
  alias SurveyBackendWeb.UsersView

  def render("index.json", %{user: user}) do
    %{data: render_many(user, UsersView, "users.json")}
  end

  def render("show.json", %{users: users}) do
    %{data: render_one(users, UsersView, "users.json")}
  end

  def render("users.json", %{users: users}) do
    %{id: users.id,
      firstname: users.firstname,
      lastname: users.lastname,
      gender: users.gender,
      phone: users.phone,
      email: users.email,
      status: users.status,
      verified: users.verified}
  end
end
