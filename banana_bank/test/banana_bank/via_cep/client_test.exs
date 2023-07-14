defmodule BananaBank.ViaCep.ClientTest do
  use ExUnit.Case, async: true

  alias BananaBank.ViaCep.Client

  setup do
    bypass = Bypass.open()
    {:ok, bypass: bypass}
  end

  describe "call/1" do
    test "successfully returns cep info", %{bypass: bypass} do
      cep = "2956000"

      expected_response = "banana"

      # Bypass.expect(bypass, fn conn ->
      #   Plug.Conn.resp(conn, 200, "")
      # end)

      response = Client.call(cep)

      assert response = expected_response
    end
  end
end
