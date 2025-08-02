extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "Player":
		if GameState.player_has_item("Janitor_Uniform"):
			pass
		else:
			caught_player()

func caught_player():
	DialogueManager.show_dialogue_balloon(load("res://NPCs/Guard/Guard_Caught.dialogue"))
