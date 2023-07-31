defmodule Bananex.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BananexWeb.Telemetry,
      # Start the Ecto repository
      Bananex.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Bananex.PubSub},
      # Start Finch
      {Finch, name: Bananex.Finch},
      # Start the Endpoint (http/https)
      BananexWeb.Endpoint,
      # Start a worker by calling: Bananex.Worker.start_link(arg)
      # {Bananex.Worker, arg}
      Bananex.Scheduler
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bananex.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BananexWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
