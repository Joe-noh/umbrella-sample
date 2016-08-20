defmodule Web.BasketItemController do
  use Web.Web, :controller

  def create(conn, _params) do
    basket_id = conn.cookies["basket_id"]
    BasketManager.add_item(basket_id, dummy_item)

    conn
    |> redirect(to: basket_path(conn, :show))
  end

  defp dummy_item do
    %BasketManager.Item{
      name: Enum.random(~w[カレー スプーン 皿 コーラ]),
      price: 100 * Enum.random(2..10)
    }
  end
end
