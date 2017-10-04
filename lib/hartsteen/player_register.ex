defmodule Hartsteen.PlayerRegister do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(Hartsteen.Server, :ok, opts)
  end

  def find(server, name) do
    GenServer.call(server, {:find, name})
  end

  def read(server) do
    GenServer.call(server, {:read})
  end

  def create(server, name) do
    GenServer.cast(server, {:create, name})
  end

end
