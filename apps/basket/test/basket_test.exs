defmodule BasketTest do
  use ExUnit.Case
  doctest Basket

  test "worker can hold a basket" do
    {:ok, basket} = Basket.new

    Basket.add_item(basket, %Basket.Item{price: 500})

    assert Basket.total_price(basket) == 500

    Basket.add_item(basket, %Basket.Item{price: 300})

    assert Basket.total_price(basket) == 800
  end
end
