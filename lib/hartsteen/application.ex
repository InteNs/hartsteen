defmodule Hartsteen.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      {Hartsteen.PlayerRegister, name: :players}
      # Starts a worker by calling: Hartsteen.Worker.start_link(arg)
      # {Hartsteen.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hartsteen.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
