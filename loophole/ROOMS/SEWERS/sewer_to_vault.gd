extends Area2D

func _on_body_entered(body: Node2D) -> void:
	pass
	#if body.name == "Player":
	#	DialogueManager.show_dialogue_balloon(load("res://ROOMS/SEWERS/vaultgrate.dialogue"))

func interact():
	DialogueManager.show_dialogue_balloon(load("res://ROOMS/SEWERS/vaultgrate.dialogue"))
