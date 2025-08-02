extends Node

var password
var current_user_guess = ""

# Called when the node enters the scene tree for the first time.
func prepare():
	if GameState.loaded_save_data["disguise_path"] == 1:
		password = "5324"
	if GameState.loaded_save_data["disguise_path"] == 2:
		password = "62145"
	if GameState.loaded_save_data["disguise_path"] == 3:
		password = "9243234235423536785"


func add_to_guess(addition: String):
	current_user_guess += addition

func check_current_guess():
	print(password)
	print(current_user_guess)
	var check = password == current_user_guess
	current_user_guess = ""
	return check
