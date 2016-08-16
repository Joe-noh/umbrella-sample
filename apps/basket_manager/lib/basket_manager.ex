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

  def new_basket do
    basket_id = generate_id()
    BasketManager.BasketSup.new_child(basket_id)

    {:ok, basket_id}
  end

  def add_item(basket_id, item) do
    BasketManager.Basket.add_item(basket_id, item)
  end

  def total_price(basket_id) do
    BasketManager.Basket.total_price(basket_id)
  end

  defp generate_id do
    :crypto.strong_rand_bytes(16)
    |> :base64.encode_to_string
    |> to_string
    |> String.replace(~r/[\n\=]/, "")
    |> String.replace(~r/\+/, "-")
    |> String.replace(~r/\//, "_")
  end
end
