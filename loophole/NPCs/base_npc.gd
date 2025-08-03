extends AnimatedSprite2D

@export var dialogue: DialogueResource 
@export var disabled: bool = false

func interact():
	if disabled:
		return
		
	DialogueManager.show_dialogue_balloon(dialogue)
