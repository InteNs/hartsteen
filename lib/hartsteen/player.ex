defmodule Hartsteen.Player do
  use Agent

  def start_link(_opts) do
    Agent.start_link(fn -> %{} end)
  end

  def hit(player, damage) do
    Agent.update(player, fn player -> Map.put(player, :health, player.health - damage) end)
  end

  def get(player, key) do
    Agent.get(player, &Map.get(&1, key))
  end

  def put(player, key, value) do
    Agent.update(player, &Map.put(&1, key, value))
  end
end
