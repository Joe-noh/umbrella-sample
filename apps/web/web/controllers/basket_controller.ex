defmodule Web.BasketController do
  use Web.Web, :controller

  def show(conn, _params) do
    {basket_id, basket_content} = get_basket(conn.cookies["basket_id"])

    conn
    |> put_resp_cookie("basket_id", basket_id)
    |> render("show.html", content: basket_content)
  end

  defp get_basket(basket_id) do
    case BasketManager.basket_content(basket_id) do
      {:ok, content} ->
        {basket_id, content}
      _ ->
        {:ok, basket_id} = BasketManager.new_basket
        {:ok, content} = BasketManager.basket_content(basket_id)
        {basket_id, content}
    end
  end
end
