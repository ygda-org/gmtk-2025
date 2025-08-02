extends StaticBody2D

@export var unlockResource: BaseItemResource
@export var consumesUnlock: bool = false
@export var dialogue: DialogueResource = load("res://INTERACTABLES/Locked_Door/Locked_Door.dialogue")

var animations: AnimatedSprite2D = null

var unlocked = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

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
			unlocked = true

func _process(delta):
	if unlocked and GameState.can_player_move:
		unlocked = false
		unlock()

func unlock():
	$CollisionShape2D.disabled = true
	$Interactable/CollisionShape2D.disabled = true
	animations = get_node("Anim")
	if animations == null:
		return
	animations.play("open")
	animations.animation_finished.connect(_animation_finished)

func _animation_finished():
	animations.play("opened")
