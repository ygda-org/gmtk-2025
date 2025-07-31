extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact():
	print(GameState.player_inventory)
	for i in range(len(GameState.player_inventory)):
		if GameState.player_inventory[i] == null:
			GameState.player_inventory[i] = $Sprite2D.texture # I don't actually know what data type to put in here yet lol
			break
