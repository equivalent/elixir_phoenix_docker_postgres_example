defmodule Moderations.PageController do
  use Moderations.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
