extends Node2D

@export var itemResource: BaseItemResource # for inventory and use functions
const JANITOR_UNIFORM_PICKUP = preload("res://INTERACTABLES/ITEMS/Janitor_Uniform/JanitorUniformPickup.dialogue")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact():
	GameState.add_item_to_player_inventory(itemResource)
	DialogueManager.show_dialogue_balloon(JANITOR_UNIFORM_PICKUP)

	
