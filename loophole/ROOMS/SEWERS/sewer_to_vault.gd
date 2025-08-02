extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		GameState.send_to_vault("sewer_path")
