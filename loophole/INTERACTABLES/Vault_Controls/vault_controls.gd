extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	if GameState.loaded_save_data["disguise_path"] == 0:
		$Keypad.visible = false
	KeypadManager.prepare()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func interact():
	DialogueManager.show_dialogue_balloon(load("res://INTERACTABLES/Vault_Controls/Vault_Controls.dialogue"))
