# ExMon

Turn-based game where we'll have a player against the computer
Human and computer start with 100 hit points.
Each round, each can make one of 3 moves:
- Moderate attack dealing between (18-25) damage
- Ranged attack dealing between (10-35) damage
- Healing power, healing between (18-25) health

With each movement, what happened and the situation of each player must be displayed on the screen.
If the player or computer has 0 life, the game is over
If someone loses, when displaying the final result, it should not be displayed that a player has negative life.
The human player will be able to choose the name of his character, as well as the name of his 3 movements.

###  Challenges:
[  ] Finishing testing other modules <br />
[  ] Raffle which player starts the match <br />
[  ] Increase the computer's chance to heal itself when below 40 health

### To run the project:

```bash
iex -S mix
```

#### Create the player:
```bash
player = ExMon.create_player("Felipe", :chute, :soco, :cura)
```
#### Start the Game:
```bash
ExMon.start_game(player)
```

#### Run move:
```bash
ExMon.make_move(:chute)
```

#### To test the project:
```bash
mix test
```
