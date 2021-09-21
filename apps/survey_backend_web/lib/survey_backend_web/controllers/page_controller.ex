defmodule SurveyBackendWeb.PageController do
  use SurveyBackendWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
