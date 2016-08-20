defmodule Web.CheckoutController do
  use Web.Web, :controller

  def create(conn, _params) do
    basket_id = conn.cookies["basket_id"]
    content = BasketManager.basket_content(basket_id)

    Payment.checkout(content)

    render(conn, "create.html", content: content)
  end
end
