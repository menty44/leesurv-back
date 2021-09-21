defmodule SurveyBackend.Repo do
  use Ecto.Repo,
    otp_app: :survey_backend,
    adapter: Ecto.Adapters.Postgres
end
