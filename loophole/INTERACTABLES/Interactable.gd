extends Area2D

# to be a child of the object you interact with

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact(player):
	get_parent().interact(player)
