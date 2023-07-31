defmodule Bananex.Fruits.InsertSingle do
  alias Bananex.Fruits.Fruit
  alias Bananex.Repo

  def call() do
    :timer.tc(fn -> do_call() end)
  end

  defp do_call() do
    Enum.each(1..15, fn _ ->
      number_of_fruits = 1..65535
      records = Enum.map(number_of_fruits, fn x ->
        %{name: "fruit #{x}"}
      end)
      Repo.insert_all(Fruit, records)
    end)
  end
end
