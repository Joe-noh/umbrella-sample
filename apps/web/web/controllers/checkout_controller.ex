defmodule Web.CheckoutController do
  use Web.Web, :controller

  def create(conn, _params) do
    basket_id = conn.cookies["basket_id"]
    {:ok, content} = BasketManager.basket_content(basket_id)

    Payment.checkout(content)
    BasketManager.terminate(basket_id)

    conn
    |> delete_resp_cookie("basket_id")
    |> render("create.html", content: content)
  end
end
