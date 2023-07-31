defmodule Bananex.Scheduler do
  use GenServer

  require Logger

  alias Bananex.Fruits.InsertSingle2

  # Server
  def init(state) do
    Logger.info("Insert fruits started...")
    InsertSingle2.call()
    schedule_event()
    {:ok, state}
  end

  def handle_info(:insert_fruits, state) do
    Logger.info("Insert fruits action")
    InsertSingle2.call()
    schedule_event()
    {:noreply, state}
  end

  def schedule_event() do
    Process.send_after(self(), :insert_fruits, :timer.minutes(1))
  end

  # Client
  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end
end
