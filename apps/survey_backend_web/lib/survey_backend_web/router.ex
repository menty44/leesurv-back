defmodule SurveyBackendWeb.Router do
  use SurveyBackendWeb, :router

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

  scope "/", SurveyBackendWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
   scope "/api", SurveyBackendWeb do
     pipe_through :api
     resources "/role", RolesController, except: [:new, :edit]
     resources "/permission", PermissionsController, except: [:new, :edit]
     resources "/menu", MenusController, except: [:new, :edit]
     resources "/country", CountriesController, except: [:new, :edit]
     resources "/profile", ProfilesController, except: [:new, :edit]
     resources "/user", UsersController, except: [:new, :edit]
     resources "/account", AccountController, except: [:new, :edit]
     resources "/email", EmailsController, except: [:new, :edit]
     resources "/sms", SmssController, except: [:new, :edit]
     resources "/activation", ActivationsController, except: [:new, :edit]
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: SurveyBackendWeb.Telemetry
    end
  end
end
