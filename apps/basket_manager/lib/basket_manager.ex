defmodule BasketManager do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(BasketManager.BasketSup, []),
    ]

    opts = [strategy: :one_for_one, name: BasketManager.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def new do
    BasketManager.BasketSup.new_child
  end

  def add_item(basket, item) do
    BasketManager.Basket.add_item(basket, item)
  end

  def total_price(basket) do
    BasketManager.Basket.total_price(basket)
  end
end
