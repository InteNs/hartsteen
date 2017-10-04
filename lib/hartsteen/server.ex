defmodule Hartsteen.Server do
  # server
  def init(:ok) do
    {:ok, %{}}
  end

  def handle_call({:find, name}, _from, players) do
    {:reply, Map.fetch(players, name), players}
  end

  def handle_call({:read}, _from, players) do
    {:reply, players, players}
  end

  def handle_cast({:create, name}, players) do
    if Map.has_key?(players, name) do
      {:noreply, players}
    else
      {:ok, player} = Hartsteen.Player.start_link([])
      {:noreply, Map.put(players, name, player)}
    end
  end
end
