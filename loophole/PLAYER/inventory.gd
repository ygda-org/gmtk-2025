extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Item1.texture = GameState.player_inventory[0]
	$Item2.texture = GameState.player_inventory[1]
	$Item3.texture = GameState.player_inventory[2]
	$Item4.texture = GameState.player_inventory[3]
	$Item5.texture = GameState.player_inventory[4]
	$Item6.texture = GameState.player_inventory[5]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Item1.texture = GameState.player_inventory[0]
	$Item2.texture = GameState.player_inventory[1]
	$Item3.texture = GameState.player_inventory[2]
	$Item4.texture = GameState.player_inventory[3]
	$Item5.texture = GameState.player_inventory[4]
	$Item6.texture = GameState.player_inventory[5]
