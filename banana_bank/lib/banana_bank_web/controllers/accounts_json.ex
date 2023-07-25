defmodule BananaBankWeb.AccountsJSON do
  alias BananaBank.Accounts.Account

  def create(%{account: account}) do
    %{
      message: "Account created with success!",
      data: data(account)
    }
  end

  defp data(%Account{} = account) do
    %{
      id: account.id,
    }
  end
end
