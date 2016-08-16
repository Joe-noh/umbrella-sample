defmodule Basket.Worker do
  use GenServer

  # callbacks

  def start_link do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_), do: {:ok, %Basket{}}

  def handle_cast({:add_item, item}, basket = %{items: items}) do
    new_state = %Basket{basket | items: [item | items]}

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

  def add_item(pid, item) do
    GenServer.cast(pid, {:add_item, item})
  end

  def total_price(pid) do
    GenServer.call(pid, :total_price)
  end
end
