defmodule Bananex.Tks do

  def call do
    # Task.start(&heavy_work/0)
    # light_work()

    task = Task.async(&heavy_work/0)
    res2 = light_work()
    res2 + Task.await(task)
  end

  defp heavy_work do
    :timer.sleep(5000)
    IO.inspect("Heavy work")
    5
  end

  @spec light_work :: 2
  def light_work do
    :timer.sleep(500)
    IO.inspect("Light work")
    2
  end
end
