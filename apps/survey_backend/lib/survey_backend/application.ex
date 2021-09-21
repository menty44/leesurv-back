defmodule SurveyBackend.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      SurveyBackend.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: SurveyBackend.PubSub}
      # Start a worker by calling: SurveyBackend.Worker.start_link(arg)
      # {SurveyBackend.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: SurveyBackend.Supervisor)
  end
end
