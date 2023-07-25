defmodule BananaBank.Accounts.Create do
  alias BananaBank.Accounts.Account
  alias BananaBank.Repo

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
