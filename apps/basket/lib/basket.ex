defmodule Basket do
  use Application

  defstruct items: []

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Basket.WorkerSup, []),
    ]

    opts = [strategy: :one_for_one, name: Basket.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def new do
    Basket.WorkerSup.new_child
  end

  def add_item(basket, item) do
    Basket.Worker.add_item(basket, item)
  end

  def total_price(basket) do
    Basket.Worker.total_price(basket)
  end
end
