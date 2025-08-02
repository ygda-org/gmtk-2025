extends Node2D

@export var dialogue_resource: DialogueResource
@export var enabled: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameState.starting_cutscene:
		DialogueManager.show_dialogue_balloon(dialogue_resource)
		GameState.starting_cutscene = false
	else:
		%CutscenePlayer.active = false
