defmodule Kv.Store do
  use GenServer

  @name {:global, __MODULE__}

  # callbacks

  def start_link do
    GenServer.start_link(__MODULE__, nil, name: @name)
  end

  def init(_), do: {:ok, %{}}

  def handle_cast({:put, key, val}, state) do
    {:noreply, Map.put(state, key, val)}
  end

  def handle_call({:get, key}, _from, state) do
    {:reply, Map.get(state, key, nil), state}
  end

  # interfaces

  def put(key, val) do
    GenServer.cast(@name, {:put, key, val})
  end

  def get(key) do
    GenServer.call(@name, {:get, key})
  end
end
