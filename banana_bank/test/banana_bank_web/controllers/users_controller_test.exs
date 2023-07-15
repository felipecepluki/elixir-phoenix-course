defmodule BananaBankWeb.UsersControllerTest do
  use BananaBankWeb.ConnCase

  import Mox

  alias BananaBank.Users
  alias Users.User

  setup do
    params = %{
      "name" => "João",
      "cep" => "29560000",
      "email" => "joao@banana.com",
      "password" => "123456"
    }

    body = %{
      "bairro": "",
      "cep": "29560-000",
      "complemento": "",
      "ddd": "28",
      "gia": "",
      "ibge": "3202306",
      "localidade": "Guaçuí",
      "logradouro": "",
      "siafi": "5645",
      "uf": "ES"
    }

    {:ok, %{user_params: params}}
  end

  describe "create/2" do
    test "successfully creates an user", %{conn: conn, body: user_params: params} do
      params = %{
        "name" => "João",
        "cep" => "29560000",
        "email" => "joao@banana.com",
        "password" => "123456"
      }

      body = %{
        "bairro": "",
        "cep": "29560-000",
        "complemento": "",
        "ddd": "28",
        "gia": "",
        "ibge": "3202306",
        "localidade": "Guaçuí",
        "logradouro": "",
        "siafi": "5645",
        "uf": "ES"
      }

      expect(BananaBank.ViaCep.ClientMock, :call, fn "2956000" -> 
        {:ok, body}
      end)

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:created)

      assert %{
        "data" => %{"cep" => "29560000", "email" => "joao@banana.com", "id" => _id, "name" => "João"},
        "message" => "User created with success!"
      } = response
    end
    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{
        name: nil,
        cep: "29560000",
        email: "joao@banana.com",
        password: "123456"
      }

      expect(BananaBank.ViaCep.ClientMock, :call, fn "2956000" -> 
        {:ok, ""}
      end)

      response =
        conn
        |> post(~p"/api/users", params)
        |> json_response(:bad_request)

      expected_response = %{"errors" => %{"cep" => ["should be 8 character(s)"], "name" => ["can't be blank"]}}

      assert response = expected_response
    end
  end

  describe "delete/2" do
    test "successfully deletes an user", %{conn: conn, body: user_params: params} do
      params = %{
        "name" => "João",
        "cep" => "29560000",
        "email" => "joao@banana.com",
        "password" => "123456"
      }

      body = %{
        "bairro": "",
        "cep": "29560-000",
        "complemento": "",
        "ddd": "28",
        "gia": "",
        "ibge": "3202306",
        "localidade": "Guaçuí",
        "logradouro": "",
        "siafi": "5645",
        "uf": "ES"
      }

      espect(BananaBank.ViaCep.ClientMock, :call, fn "2956000" -> 
        {:ok, body}
      end)

      {:ok, %User{id: id}} = Users.create(params)

      response =
        conn
        |> delete(~p"/api/users/#{id}")
        |> json_response(:ok)

        expected_response = %{
          "data" => %{"cep" => "2956000", "email" => "joao@banana.com", "id" => id, "name" => "João"}
        }

        assert response = expected_response
    end
  end
end
