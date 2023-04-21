defmodule ExMon.Game.Actions.Attack do
  alias ExMon.Game
  alias ExMon.Game.Status

  @move_avg_power 18..25
  @move_rnd_power 10..35

  def attack_opponent(opponnent, move) do
    damage = calculate_power(move)
    opponnent
    |> Game.fetch_player()
    |> Map.get(:life)
    |> calculate_total_life(damage)
    |> update_opponnent_life(opponnent, damage)
  end

  defp calculate_power(:move_avg), do: Enum.random(@move_avg_power)
  defp calculate_power(:move_rnd), do: Enum.random(@move_rnd_power)
  defp calculate_total_life(life, damage) when life - damage < 0, do: 0
  defp calculate_total_life(life, damage), do: life - damage
  defp update_opponnent_life(life, opponnent, damage) do
    opponnent
    |> Game.fetch_player()
    |> Map.put(:life, life)
    |> update_game(opponnent, damage)
  end

  defp update_game(player, opponnent, damage) do
    Game.info()
    |> Map.put(opponnent, player)
    |> Game.update()

    Status.print_move_message(opponnent, :attack, damage)
  end
end
