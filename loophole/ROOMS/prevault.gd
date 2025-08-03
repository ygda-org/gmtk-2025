extends "res://ROOMS/SCENE_MANAGEMENT/base_scene.gd"

func _ready() -> void:
	if GameState.FLOOD_CUTSCENE:
		$flood.visible = true
		$door.visible = false

func reset_scene():
	SceneSwitcher.goto_scene(load("res://ROOMS/prevault.tscn") as PackedScene, "FireAlarm")

func _on_sewer_timer_timeout() -> void:
	if GameState.FLOOD_CUTSCENE:
		GameState.send_to_vault("sewer_path")
