defmodule Web.BasketControllerTest do
  use Web.ConnCase

  alias Web.Basket
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, basket_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing baskets"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, basket_path(conn, :new)
    assert html_response(conn, 200) =~ "New basket"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, basket_path(conn, :create), basket: @valid_attrs
    assert redirected_to(conn) == basket_path(conn, :index)
    assert Repo.get_by(Basket, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, basket_path(conn, :create), basket: @invalid_attrs
    assert html_response(conn, 200) =~ "New basket"
  end

  test "shows chosen resource", %{conn: conn} do
    basket = Repo.insert! %Basket{}
    conn = get conn, basket_path(conn, :show, basket)
    assert html_response(conn, 200) =~ "Show basket"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, basket_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    basket = Repo.insert! %Basket{}
    conn = get conn, basket_path(conn, :edit, basket)
    assert html_response(conn, 200) =~ "Edit basket"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    basket = Repo.insert! %Basket{}
    conn = put conn, basket_path(conn, :update, basket), basket: @valid_attrs
    assert redirected_to(conn) == basket_path(conn, :show, basket)
    assert Repo.get_by(Basket, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    basket = Repo.insert! %Basket{}
    conn = put conn, basket_path(conn, :update, basket), basket: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit basket"
  end

  test "deletes chosen resource", %{conn: conn} do
    basket = Repo.insert! %Basket{}
    conn = delete conn, basket_path(conn, :delete, basket)
    assert redirected_to(conn) == basket_path(conn, :index)
    refute Repo.get(Basket, basket.id)
  end
end
