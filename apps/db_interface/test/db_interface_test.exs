defmodule DbInterfaceTest do
  use ExUnit.Case
  doctest DbInterface

  test "greets the world" do
    assert DbInterface.hello() == :world
  end
end
