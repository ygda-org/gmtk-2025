extends "res://NPCs/base_npc.gd"

@export var anim : String # adam, alex, amelia, bob

func _ready() -> void:
	if anim != null:
		play(anim)
