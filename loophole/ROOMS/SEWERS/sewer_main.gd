extends "res://ROOMS/SCENE_MANAGEMENT/base_scene.gd"

func _ready() -> void:
	if GameState.loaded_save_data["sewer_path"] == 0:
		$planks.visible = true
	elif GameState.loaded_save_data["sewer_path"] > 0:
		$barriers2.collision_enabled = true
		$planksbroken.visible = true
