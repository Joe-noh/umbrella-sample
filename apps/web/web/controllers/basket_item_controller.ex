defmodule Web.BasketItemController do
  use Web.Web, :controller

  def create(conn, %{"basket_id" => basket_id}) do
    BasketManager.add_item(basket_id, dummy_item)

    conn
    |> redirect(to: basket_path(conn, :show, basket_id))
  end

  defp dummy_item do
    %BasketManager.Item{
      name: Enum.random(~w[カレー スプーン 皿 コーラ]),
      price: 100 * Enum.random(2..10)
    }
  end
end
