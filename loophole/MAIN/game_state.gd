extends Node

var player_inventory = [BaseItemResource] # what data type should this hold?

var starting_cutscene = true

const SAVE_PATH: String = "user://savedata.json"
const START_SAVE_DATA : Dictionary[String, Variant] = {
	"disguise_path": 0,
	"vent_path": 0,
	"sewer_path": 0,
	"inspector_path": 0,
	"has_watched_intro": false
}

var loaded_save_data: Dictionary = {}

var can_player_move: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.dialogue_ended.connect(dialogue_finished)
	DialogueManager.dialogue_started.connect(dialogue_started)
	reset_player_inventory()

func dialogue_finished(resource):
	can_player_move = true

func dialogue_started(resource):
	can_player_move = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_item_to_player_inventory(item):
	for i in range(len(player_inventory)):
		if player_inventory[i] == null:
			player_inventory[i] = item # BaseItemResources go into the inventory array
			break

func player_has_item(item: Variant):
	if item is String:
		for i in player_inventory:
			if i == null:
				continue
			if i.itemName == item:
				return true
		return false
	elif item is BaseItemResource:
		for i in player_inventory:
			if i == null:
				continue
			if i.itemName == item.itemName:
				return true
		return false
	else:
		print("player_has_item called without proper parameter type")
		return false

func reset_player_inventory():
	GameState.player_inventory = [null, null, null, null, null, null]


func create_new_save_file() -> int:
	var json_save_data: String = JSON.stringify(START_SAVE_DATA)
	
	var file_access := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if not file_access:
		print("Error occured while trying to write save data:", FileAccess.get_open_error())
		return FAILED

	file_access.store_line(json_save_data)
	file_access.close()
	print("Created save file at: " + file_access.get_path_absolute())
	
	loaded_save_data = START_SAVE_DATA
	return OK
	
func load_save_file() -> int:
	if not FileAccess.file_exists(SAVE_PATH):
		print("Couldn't find the save data!")
		return FAILED
	
	var file_access := FileAccess.open(SAVE_PATH, FileAccess.READ)
	var json_string := file_access.get_line()
	
	var json := JSON.new()
	var error = json.parse(json_string)
	if error:
		print("Couldn't parse the JSON save data: " + json.get_error_message())
		print("Save data: " + json_string)
		return FAILED
	
	loaded_save_data = json.data
	print("Loaded save data: " + str(loaded_save_data))
	return OK

func save_game() -> int:
	var json_save_data: String = JSON.stringify(loaded_save_data)
	
	var file_access := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if not file_access:
		print("Error occured while trying to write save data:", FileAccess.get_open_error())
		return FAILED

	file_access.store_line(json_save_data)
	file_access.close()
	print("Saved game at at: " + file_access.get_path_absolute())
	
	return OK	

func has_watched_intro():
	return loaded_save_data["has_watched_intro"]

func get_cutscene_player() -> AnimationPlayer:
	return get_tree().current_scene.get_node("CutscenePlayer")
