extends Node

var player_inventory = [BaseItemResource] # what data type should this hold?

# Called when the node enters the scene tree for the first time.
func _ready():
	reset_player_inventory()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func reset_player_inventory():
	GameState.player_inventory = [null, null, null, null, null, null]
