extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func interact():
	DialogueManager.show_dialogue_balloon(load("res://INTERACTABLES/Vent_Path_interactables/janitorrmvent.dialogue"))
	pass
