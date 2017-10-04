defmodule HartsteenTest do
  use ExUnit.Case
  doctest Hartsteen

  test "greets the world" do
    assert Hartsteen.hello() == :world
  end
end
