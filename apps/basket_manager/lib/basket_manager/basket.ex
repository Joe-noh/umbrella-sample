defmodule BasketManager.Basket do
  use GenServer

  defstruct items: []

  # callbacks

  def start_link(basket_id) do
    GenServer.start_link(__MODULE__, nil, name: via(basket_id))
  end

  def init(_), do: {:ok, %BasketManager.Basket{}}

  def handle_cast({:add_item, item}, basket = %{items: items}) do
    new_state = %BasketManager.Basket{basket | items: [item | items]}

    {:noreply, new_state}
  end

  def handle_call(:total_price, _from, basket = %{items: items}) do
    total = items
      |> Enum.reduce(0, fn (item, acc) ->
        item.price + acc
      end)

    {:reply, total, basket}
  end

  # interfaces

  def add_item(id, item) do
    GenServer.cast(via(id), {:add_item, item})
  end

  def total_price(id) do
    GenServer.call(via(id), :total_price)
  end

  defp via(basket_id) do
    {:via, :gproc, {:n, :l, {:basket, basket_id}}}
  end
end
