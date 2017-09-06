defmodule PlateSlateWeb.Query.MenuItemsTest do
  use PlateSlateWeb.ConnCase

  setup do
    Code.eval_file("priv/repo/seeds.exs")
    :ok
  end

  test "list menu items without filter" do
    query = """
    {
      menuItems { name}
    }
    """

    conn = get build_conn(), "/", query: query # Blank Phoenix connection

    # json_response decodes the JSON
    assert %{"data" => %{"menuItems" => [item | _]}} = json_response(conn, 200)
    assert item == %{"name" => "Rueben"}
  end

  test "list menu items without filter with POST" do
    query = """
    {
      menuItems { name }
    }
    """

    conn =
      build_conn()
      |> Plug.Conn.put_req_header("content-type", "application/json")
      |> post("/", %{"query" => query})

    # json_response decodes the JSON
    assert %{"data" => %{"menuItems" => [item | _]}} = json_response(conn, 200)
    assert item == %{"name" => "Rueben"}
  end

end
