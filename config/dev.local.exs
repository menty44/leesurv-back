import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :survey_backend, SurveyBackend.Repo,
  username: "postgres",
  password: "menty44",
  database: "survey_backend_dev"

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :survey_backend_web, SurveyBackendWeb.Endpoint,
  http: [port: 4004]

# Print only warnings and errors during test
config :logger, level: :warn
