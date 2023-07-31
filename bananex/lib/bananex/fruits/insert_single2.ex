defmodule Bananex.Fruits.InsertSingle2 do
  alias Bananex.Fruits.Fruit
  alias Bananex.Repo

  def call() do
    :timer.tc(fn -> do_call() end)
  end

  defp do_call() do
    number_of_fruits = 1..983_025

    number_of_fruits
    |> Stream.map(fn x -> %{name: "fruit #{x}"} end)
    |> Stream.chunk_every(8191)
    |> Task.async_stream(fn chunck -> Repo.insert_all(Fruit, chunck) end, max_concurrency: 8)
    |> Stream.run()
  end
end
