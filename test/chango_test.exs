defmodule ChangoTest do
  use ExUnit.Case
  doctest Chango

  test "greets the world" do
    assert Chango.hello() == :world
  end
end
