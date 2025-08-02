extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact():
	if GameState.player_has_called:
		DialogueManager.show_dialogue_balloon(load("res://NPCs/Wall_Phone/WaitingArea.dialogue"))
