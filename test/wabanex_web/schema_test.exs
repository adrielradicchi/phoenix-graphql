defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.{User, Users.Create}

  describe "users queries" do
    test "when a valid id is given, return the user", %{conn: conn} do
      params = %{
        email: "adriel#{System.unique_integer([:positive])}@lealbits.com",
        name: "Adriel",
        password: "123456"
      }

      {:ok, %User{id: user_id}} = Create.call(params)

      query = """
        {
          getUser(id: "#{user_id}"){
            name
          }
        }
      """

      expected_response = %{
        "data" => %{
          "getUser" => %{
            "name" => "Adriel"
          }
        }
      }

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:ok)

      assert expected_response == response
    end
  end

  describe "users mutations" do
    test "when all params are valid, return a user", %{conn: conn} do
      mutation = """
        mutation {
          createUser(input: {name: "Adriel", email: "adriel#{System.unique_integer([:positive])}@lealbits.com", password: "123456"}){
            id
            name
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(:ok)

      assert %{
               "data" => %{
                 "createUser" => %{"id" => _id, "name" => "Adriel"}
               }
             } = response
    end
  end
end
