defmodule SurveyBackendWeb.EmailsView do
  use SurveyBackendWeb, :view
  alias SurveyBackendWeb.EmailsView

  def render("index.json", %{email: email}) do
    %{data: render_many(email, EmailsView, "emails.json")}
  end

  def render("show.json", %{emails: emails}) do
    %{data: render_one(emails, EmailsView, "emails.json")}
  end

  def render("emails.json", %{emails: emails}) do
    %{id: emails.id,
      email: emails.email,
      subject: emails.subject,
      message: emails.message}
  end
end
