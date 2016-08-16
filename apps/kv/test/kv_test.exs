defmodule KvTest do
  use ExUnit.Case
  doctest Kv

  test "put and get works" do
    Kv.Store.put(:a, 1)

    assert Kv.Store.get(:a) == 1
  end

  test "overwrite" do
    Kv.Store.put(:a, 1)
    Kv.Store.put(:a, 2)

    assert Kv.Store.get(:a) == 2
  end
end
