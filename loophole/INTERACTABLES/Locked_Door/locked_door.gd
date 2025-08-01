extends StaticBody2D

@export var unlockResource: BaseItemResource
@export var consumesUnlock: bool = false
@export var dialogue: DialogueResource = load("res://INTERACTABLES/Locked_Door/Locked_Door.dialogue")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact():
	DialogueManager.show_dialogue_balloon(dialogue)
	attempt()

func attempt():
	for i in range(len(GameState.player_inventory)):
		if GameState.player_inventory[i] == null or unlockResource.itemName == null:
			continue
		if unlockResource.itemName == GameState.player_inventory[i].itemName:
			if consumesUnlock:
				GameState.player_inventory[i] == null
			unlock()

func unlock():
	queue_free() # prolly might wanna do this differently later
