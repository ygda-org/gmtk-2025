extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if GameState.loaded_save_data["inspector_path"] != 2:
		get_parent().queue_free()
