defmodule PhoenixElmWebsocketBoilerplateWeb.PageControllerTest do
  use PhoenixElmWebsocketBoilerplateWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "<div id=\"elm_target\"></div>"
  end
end
