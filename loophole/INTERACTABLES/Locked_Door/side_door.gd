extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		play("Open")


func _on_area_2d_body_exited(body):
	if body.name == "Player":
		play("Close")


func _on_animation_finished():
	if animation == "Close":
		play("Closed")
	elif animation == "Open":
		play("Opened")
