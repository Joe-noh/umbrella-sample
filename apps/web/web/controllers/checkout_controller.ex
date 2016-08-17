defmodule Web.CheckoutController do
  use Web.Web, :controller

  def create(conn, %{"basket_id" => basket_id}) do
    content = BasketManager.basket_content(basket_id)

    Payment.checkout(content)

    render(conn, "create.html", content: content)
  end
end
