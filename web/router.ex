defmodule HelloPhoenix.Router do
  use HelloPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html", "text"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/admin", HelloPhoenix.Admin, as: :admin do
    pipe_through :browser

    resources "/images",  ImageController
    resources "/reviews", ReviewController
    resources "/users",   UserController
  end

  scope "/", HelloPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/redirect_test", PageController, :redirect_test, as: :redirect_test
    get "/toto", PageController, :toto
    get "/test", PageController, :test

    get "/", PageController, :index
    get "/foo", PageController, :show
    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    get "/201", PageController, :resp
    get "/404", PageController, :pagenotfound
    get "/nolayout", PageController, :nolayout
    get "/admin", PageController, :admin

    resources "/reviews", ReviewController

    resources "/users", UserController do
      resources "/posts", PostController, only: [:index, :show]
    end
    resources "/comments", CommentController, except: [:delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloPhoenix do
  #   pipe_through :api
  # end
end
