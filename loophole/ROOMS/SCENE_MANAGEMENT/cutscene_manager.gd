extends Node2D

@export var cutscene_path: String
var dialogue_resource = load(cutscene_path)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.show_dialogue_balloon(dialogue_resource)
