defmodule HelloPhoenix.PageController do
  use HelloPhoenix.Web, :controller

  # def index(conn, _params) do
    # conn
    # |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    # |> put_flash(:error, "Let's pretend we have an error.")
    # |> render(:index)

    # conn
    # |> put_status(202)
    # |> render("index.html")
  # end

  def test(conn, _params) do
    render conn, "test.html"
  end

  def index(conn, _params) do
    pages = [%{title: "foo"}, %{title: "bar"}]

    render conn, "index.json", pages: pages
  end

  def show(conn, _params) do
    page = %{title: "foo"}

    render conn, "show.json", page: page
  end

  def toto(conn, _params) do
    redirect conn, to: "/redirect_test"
  end

  def redirect_test(conn, _params) do
    text conn, "Redirect!"
  end

  def pagenotfound(conn, _params) do
    conn
    |> put_status(:not_found)
    |> render(HelloPhoenix.ErrorView, "404.html")
  end

  def resp(conn, _params) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(201, "")
  end

  def nolayout(conn, _params) do
    conn
    |> put_layout(false)
    |> render("index.html")
  end

  def admin(conn, _params) do
    conn
    |> put_layout("admin.html")
    |> render("index.html")
  end
end
