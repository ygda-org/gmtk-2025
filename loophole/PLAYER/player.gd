extends CharacterBody2D

const SPEED = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = Input.get_vector("left", "right", "up", "down") * SPEED
	move_and_slide()
