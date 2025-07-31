extends CharacterBody2D

const SPEED = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("interact"):
		var interactables = $InteractionArea.get_overlapping_areas()
		for i in interactables:
			if i.is_in_group("interactable"):
				i.interact(self)
	
	velocity = Input.get_vector("left", "right", "up", "down") * SPEED
	move_and_slide()
