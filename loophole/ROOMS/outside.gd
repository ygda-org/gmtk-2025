extends "res://ROOMS/SCENE_MANAGEMENT/base_scene.gd"

var played_rant = false

func _ready() -> void:
	if GameState.loaded_save_data["sewer_path"] >= 3:
		$sewercover.visible = true
		$sewercover2.collision_enabled = true
	# WARNING CHANGE TO ALL PATHS BEFORE EXPORT
	if GameState.check_all_paths_finished() and not GameState.played_rant:
		print("ACTIVATE FINAL ENDING")
		DialogueManager.show_dialogue_balloon(load("res://ROOMS/CUTSCENES/final_fix.dialogue"))
		await DialogueManager.dialogue_ended
		GameState.final_scene = true
		GameState.played_rant = true
