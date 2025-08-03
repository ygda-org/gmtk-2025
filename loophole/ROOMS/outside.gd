extends "res://ROOMS/SCENE_MANAGEMENT/base_scene.gd"

func _ready() -> void:
	if GameState.loaded_save_data["sewer_path"] >= 3:
		$sewercover.visible = true
		$sewercover2.collision_enabled = true
	# WARNING CHANGE BEFORE EXPORT
	if GameState.check_lazy():
		print("ACTIVATE FINAL ENDING")
		DialogueManager.show_dialogue_balloon(load("res://ROOMS/CUTSCENES/final_fix.dialogue"))
		await DialogueManager.dialogue_ended
		GameState.final_scene = true
