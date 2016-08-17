defmodule Web.Router do
  use Web.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Web do
    pipe_through :browser # Use the default browser stack

    get  "/basket/new",        BasketController, :new
    get  "/basket/:basket_id", BasketController, :show
    post "/basket",            BasketController, :create

    post "/basket/:basket_id/item", BasketItemController, :create
    post "/basket/:basket_id/checkout", CheckoutController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", Web do
  #   pipe_through :api
  # end
end
