extends Node2D

@export var itemResource: BaseItemResource # for inventory and use functions

# Called when the node enters the scene tree for the first time.
func _ready():
	itemResource.inventory_texture = $Sprite2D.texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact():
	for i in range(len(GameState.player_inventory)):
		if GameState.player_inventory[i] == null:
			GameState.player_inventory[i] = itemResource # BaseItemResources go into the inventory array
			break

	
