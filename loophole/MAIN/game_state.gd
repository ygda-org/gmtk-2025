extends Node

var player_inventory = [BaseItemResource] # what data type should this hold?

var FLOOD_CUTSCENE = false

var starting_cutscene = true

const SAVE_PATH: String = "user://savedata.json"
const START_SAVE_DATA : Dictionary[String, Variant] = {
	"disguise_path": 0,# 3
	"vent_path": 0,# 2
	"sewer_path": 0,# 3
	"inspector_path": 0,# 3
	"has_watched_intro": false,
	"has_watched_first": false,
	"last_playthrough": "intro",
	"flooded": false,
	"ending": 0
}
const SCREWDRIVER = preload("res://INTERACTABLES/ITEMS/Screwdriver/Screwdriver.tres")

var loaded_save_data: Dictionary = {}
var current_ending: String = "none"
const VAULT = preload("res://ROOMS/vault.tscn")
const OUTSIDE = preload("res://ROOMS/Outside.tscn")

var can_player_move: bool = true

var player_has_timeskipped: bool = false
var player_has_called: bool = false

const WINCOND_PATH: String = "user://properties.txt"
var absolute_wincond_path : String
var final_scene : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.dialogue_ended.connect(dialogue_finished)
	DialogueManager.dialogue_started.connect(dialogue_started)
	reset_player_inventory()
	print(create_win_file())
	print(get_win_file())

func dialogue_finished(resource):
	can_player_move = true

func dialogue_started(resource):
	can_player_move = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not final_scene:
		return
	var current_properties = get_win_file()
	can_player_move = int(current_properties[3])
	if int(current_properties[5]) == 1 and int(current_properties[1]) == 0:
		send_to_vault("ending")
		final_scene = false

func add_item_to_player_inventory(item):
	for i in range(len(player_inventory)):
		if player_inventory[i] == null:
			AudioManager.create_audio_with_variance(SFXSettings.SOUND_EFFECT_LABEL.ItemPickup, Vector2(0.9,1.1))
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
	
	loaded_save_data.assign(START_SAVE_DATA)
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

func has_watched_first():
	return loaded_save_data["has_watched_first"]

func set_watched_first():
	loaded_save_data.set("has_watched_first",true)

func has_flooded():
	return loaded_save_data["flooded"]

func set_flooded():
	loaded_save_data.set("flooded",not loaded_save_data["flooded"])

func get_cutscene_player() -> AnimationPlayer:
	return get_tree().current_scene.get_node("CutscenePlayer")

func send_to_vault(ending: String):
	if not START_SAVE_DATA.keys().has(ending) and ending != "intro":
		print("Tried to call send_to_vault() with invalid ending!")
		return
	
	GameState.can_player_move = false
	current_ending = ending
	print("Set ending to: " + ending)

	SceneSwitcher.goto_scene(VAULT, "PrevaultDoor")
	
	
func restart_game():
	reset_player_inventory()
	player_has_timeskipped = false
	player_has_called = false
	loaded_save_data.set("flooded",false)
	FLOOD_CUTSCENE = false
	
	if current_ending == "intro":
		loaded_save_data.set("has_watched_intro", true)
	elif START_SAVE_DATA.keys().has(current_ending):
		loaded_save_data.set("last_playthrough", current_ending)
		loaded_save_data[current_ending] += 1
	
	current_ending = "none"
	save_game()
	
	SceneSwitcher.goto_scene(OUTSIDE, "")

func create_win_file():
	var file_access := FileAccess.open(WINCOND_PATH, FileAccess.WRITE)
	if not file_access:
		print("Error occured while trying to write save data:", FileAccess.get_open_error())
		return FAILED

	file_access.store_line("ceo_has_time_warp_power=")
	file_access.store_line("true")
	file_access.store_line("player_can_move=")
	file_access.store_line("false")
	file_access.store_line("player_is_in_vault=")
	file_access.store_line("false")
	file_access.close()
	
	absolute_wincond_path = file_access.get_path_absolute()
	
	print("Created win file at: " + absolute_wincond_path)
	return OK

func get_win_file():
	var file = FileAccess.open(WINCOND_PATH, FileAccess.READ)
	var content = file.get_as_text()
	var content_list = content.split("\n", false)
	for i in range (len(content_list)):
		if content_list[i] == "true":
			content_list[i] = "1"
		if content_list[i] == "false":
			content_list[i] = "0"
	return content_list

func check_all_paths_finished():
	if loaded_save_data["disguise_path"] != 3:
		return false
	if loaded_save_data["vent_path"] != 2:
		return false
	if loaded_save_data["sewer_path"] != 3:
		return false
	if loaded_save_data["inspector_path"] != 3:
		return false
	return true

func check_lazy():
	if loaded_save_data["disguise_path"] != 0:
		return false
	if loaded_save_data["vent_path"] != 0:
		return false
	if loaded_save_data["sewer_path"] != 0:
		return false
	if loaded_save_data["inspector_path"] != 1:
		return false
	return true

func give_screwdriver(): # the other way of doing this was really tedious ok
	add_item_to_player_inventory(SCREWDRIVER)
