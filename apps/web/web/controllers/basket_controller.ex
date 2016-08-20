defmodule Web.BasketController do
  use Web.Web, :controller

  def show(conn, _params) do
    {basket_id, basket_content} = conn.cookies["basket_id"] |> get_basket

    conn
    |> put_resp_cookie("basket_id", basket_id)
    |> render("show.html", content: basket_content, basket_id: basket_id)
  end

  defp get_basket(nil) do
    {:ok, basket_id} = BasketManager.new_basket
    id_and_content(basket_id)
  end

  defp get_basket(basket_id) do
    id_and_content(basket_id)
  end

  defp id_and_content(basket_id) do
    content = BasketManager.basket_content(basket_id)
    {basket_id, content}
  end
end
