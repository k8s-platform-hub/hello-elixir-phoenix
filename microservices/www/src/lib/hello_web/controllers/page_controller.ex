defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def hello(conn, _params) do
    text conn, "<h1>hello</h1>"
  end
end
