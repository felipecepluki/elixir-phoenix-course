defmodule BananaBankWeb.UsersJSON do
  alias BananaBank.Users.User

  def create(%{user: user}) do
    %{
      message: "User created with success!",
      data: data(user)
    }
  end

  def login(%{token: token}) do
    %{
      message: "User authenticated with success!",
      bearer: token
    }
  end

  def delete(%{user: user}), do: %{data: data(user)}

  def get(%{user: user}), do: %{data: user}

  def update(%{user: user}), do: %{message: "User updated with success!", data: data(user)}

  defp data(%User{} = user) do
    %{
      message: "User created with success!",
      id: user.id,
      cep: user.cep,
      email: user.email,
      name: user.name
    }
  end
end
