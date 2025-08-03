extends Node2D

@export var dialogue: DialogueResource

func interact():
	DialogueManager.show_dialogue_balloon(dialogue)
