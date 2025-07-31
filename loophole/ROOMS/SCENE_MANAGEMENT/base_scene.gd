extends Node2D

@export var node_with_locations: Node = null

@onready var transition_player: AnimationPlayer = $TransitionLayer/AnimationPlayer
@onready var transition_layer: CanvasLayer = $TransitionLayer

var fade_out_finished: bool = false

# Called by SceneSwitcher to set location of player
func set_player_location(starting_location: String):
	var player: Node2D = $Player
	var location: Node2D = node_with_locations.get_node(starting_location)
	
	if player  == null:
		print("This scene has no player to set the location of!")
	elif location == null:
		print("Location '" + starting_location + "' doesn't exist!")
	else:
		player.position = location.position

func fade_out():
	transition_player.play("fade_out")
