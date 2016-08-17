defmodule Payment do
  require Logger

  def checkout(%{items: items, total_price: price}) do
    Logger.info(inspect items)
    Logger.info(price)
  end
end
