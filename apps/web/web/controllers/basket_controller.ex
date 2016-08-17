defmodule Web.BasketController do
  use Web.Web, :controller

  def show(conn, %{"basket_id" => basket_id}) do
    # basket_content = Basket.content(basket_id)
    basket_content = %{items: [%{name: "カレー", price: 300}]}
    render(conn, "show.html", content: basket_content)
  end

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, _params) do
    {:ok, basket_id} = BasketManager.new_basket

    conn
    |> redirect(to: basket_path(conn, :show, basket_id))
  end
end
