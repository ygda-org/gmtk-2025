extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if GameState.has_watched_intro():
		self.visible = true
	else:
		self.visible = false
