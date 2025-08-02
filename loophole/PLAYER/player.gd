extends CharacterBody2D

const SPEED = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if not GameState.can_player_move:
		$Camera2D.process_callback = 1
		return
	else:
		$Camera2D.process_callback = 0
	
	if Input.is_action_just_pressed("interact"):
		var interactables = $InteractionArea.get_overlapping_areas()
		for i in interactables:
			if i.is_in_group("interactable"):
				i.interact()
	
	velocity = Input.get_vector("left", "right", "up", "down") * SPEED
	if velocity.y > 0:
		$Anim.play("walk-down")
	move_and_slide()
