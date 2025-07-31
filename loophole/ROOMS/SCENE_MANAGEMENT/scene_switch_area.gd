extends Area2D

@export var starting_location: String 
@export var to_scene: String # Can't be packed scene due to weird engine bug

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		SceneSwitcher.goto_scene(load(to_scene) as PackedScene, starting_location)
