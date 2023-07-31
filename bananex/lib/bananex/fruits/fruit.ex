defmodule Bananex.Fruits.Fruit do
  use Ecto.Schema

  schema "fruits" do
    field :name, :string
  end
end
