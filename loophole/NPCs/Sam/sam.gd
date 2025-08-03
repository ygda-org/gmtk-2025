extends "res://NPCs/base_npc.gd"

@export var anim : String # adam, alex, amelia, bob
const SCREWDRIVER = preload("res://INTERACTABLES/ITEMS/Screwdriver/Screwdriver.tres")

func _ready() -> void:
	if anim != null:
		play(anim)

func give_screwdriver() -> void:
	GameState.add_item_to_player_inventory(SCREWDRIVER)
