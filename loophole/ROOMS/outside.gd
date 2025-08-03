extends "res://ROOMS/SCENE_MANAGEMENT/base_scene.gd"

func _ready() -> void:
	if GameState.loaded_save_data["sewer_path"] >= 3:
		$sewercover.visible = true
		$sewercover2.collision_enabled = true
