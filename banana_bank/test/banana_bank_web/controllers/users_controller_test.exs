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
    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{
        name: nil,
        cep: "12",
        email: "joao@banana.com",
        password: "123456"
      }
      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:bad_request)

      expected_response = %{"errors" => %{"cep" => ["should be 8 character(s)"], "name" => ["can't be blank"]}}

      assert response = expected_response
    end
  end
end
