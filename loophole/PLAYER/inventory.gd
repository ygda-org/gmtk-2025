extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_inventory()

func update_inventory():
	var i = 0
	for n in $Panel.get_children():
		if GameState.player_inventory[i] != null:
			n.texture = GameState.player_inventory[i].inventory_texture
		i += 1
