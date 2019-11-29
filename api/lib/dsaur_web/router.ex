defmodule DsaurWeb.Router do
  use DsaurWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DsaurWeb do
    pipe_through :api
    
    resources "/users", UserController, except: [:new, :edit]
  end
end
