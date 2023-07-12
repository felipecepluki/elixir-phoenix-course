defmodule BananaBankWeb.UsersControllerTest do
  use BananaBankWeb.ConnCase

  describe "create/2" do
    test "successfully creates an user", %{conn: conn} do
      params = %{
        name: "João",
        cep: "12345678",
        email: "joao@banana.com",
        password: "123456"
      }
      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)

      assert %{
        "data" => %{"cep" => "12345678", "email" => "joao@banana.com", "id" => _id, "name" => "João"},
        "message" => "User created with success!"
      } = response
    end
  end
end
