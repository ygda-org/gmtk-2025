extends CharacterBody2D

const SPEED = 100

@onready var anim: AnimatedSprite2D = $Anim
var current_direction: Vector2 = Vector2(0, 0)

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
		var interactables: Array[Area2D] = $InteractionArea.get_overlapping_areas()
		if interactables.size() >= 1 and interactables[0].is_in_group("interactable"):
			interactables[0].interact()
	
	var input_vector: Vector2 = Input.get_vector("left", "right", "up", "down")
	
	current_direction = input_vector if input_vector != Vector2.ZERO else current_direction 
	velocity =  input_vector * SPEED
	
	
	if velocity == Vector2.ZERO:
		if current_direction.y > 0:
			anim.play("idle_down")
		elif current_direction.y < 0:
			anim.play("idle_up")
		elif current_direction.x > 0:
			anim.play("idle_right")
		elif current_direction.x < 0:
			anim.play("idle_left")
	else:
		if velocity.y > 0:
			anim.play("walk_down")
		elif velocity.y < 0:
			anim.play("walk_up")
		elif velocity.x > 0:
			anim.play("walk_right")
		elif velocity.x < 0:
			anim.play("walk_left")
	
	
	move_and_slide()

func set_animation(animation: String) -> void:
	anim.play(animation)
