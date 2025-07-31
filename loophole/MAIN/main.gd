extends Node2D

const STARTING_SCENE = preload("res://ROOMS/Outside.tscn")

func _on_load_pressed() -> void:
	if GameState.load_save_file() == OK:
		SceneSwitcher.goto_scene(STARTING_SCENE, "")
	else:
		print("Unabled to load save file! Maybe it doesn't exist?")

func _on_new_game_pressed() -> void:
	GameState.create_new_save_file()
	
	SceneSwitcher.goto_scene(STARTING_SCENE, "")
