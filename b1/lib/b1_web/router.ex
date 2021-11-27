defmodule B1Web.Router do
  use B1Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {B1Web.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/hangman", B1Web do
    pipe_through :browser

    get "/", HangmanController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", B1Web do
  #   pipe_through :api
  # end
end
