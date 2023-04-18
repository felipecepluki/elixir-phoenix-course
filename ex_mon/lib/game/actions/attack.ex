defmodule ExMon.Game.Actions.Attack do
  alias ExMon.Game

  @move_avg_power 18..25
  @move_rnd_power 10..35

  def attack_opponent(opponnent, move) do
    damage = calculate_power(move)
    opponnent
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life(damage)
    |> update_opponnent_life(opponnent)
  end

  defp calculate_power(:move_avg), do: Enum.random(@move_avg_power)
  defp calculate_power(:move_rnd), do: Enum.random(@move_rnd_power)
  defp calculate_total_life(life, damage) when life - damage < 0, do: 0
  defp calculate_total_life(life, damage), do: life - damage
  defp update_opponnent_life(life, opponnent) do
    opponnent
    |> Game.fetch_player()
    |> Map.put(:life, life)
  end
end
