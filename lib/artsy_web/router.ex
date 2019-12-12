defmodule ArtsyWeb.Router do
  use ArtsyWeb, :router

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

  scope "/", ArtsyWeb do
    pipe_through :browser

    get "/", ArtistsController, :index
    get "/artists/:id", ArtistsController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", ArtsyWeb do
  #   pipe_through :api
  # end
end
