# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :survey_backend,
  ecto_repos: [SurveyBackend.Repo]

config :survey_backend_web,
  ecto_repos: [SurveyBackend.Repo],
  generators: [context_app: :survey_backend]

# Configures the endpoint
config :survey_backend_web, SurveyBackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GKHdky6Lt71kUpJFITbi+pTWs7nmZzfY2A7esxOTz+0EAlm46JoeqVvkx6uIY82Y",
  render_errors: [view: SurveyBackendWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: SurveyBackend.PubSub,
  live_view: [signing_salt: "/f+mvvTD"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
