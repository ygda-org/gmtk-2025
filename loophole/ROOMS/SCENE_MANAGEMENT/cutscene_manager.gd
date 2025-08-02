extends Node2D

@export var dialogue_resource: DialogueResource
@export var enabled: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DialogueManager.show_dialogue_balloon(dialogue_resource)
