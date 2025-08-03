extends Node

# turns out I'm also using this for phone dialing lol

var password
var current_user_guess = ""

var current_dial: String = ""
const bank_number: String = "9864572384"

# Called when the node enters the scene tree for the first time.
func prepare():
	if GameState.loaded_save_data["disguise_path"] == 1:
		password = "5324"
	if GameState.loaded_save_data["disguise_path"] == 2:
		password = "62145"
	if GameState.loaded_save_data["disguise_path"] == 3:
		password = "HAHA"


func add_to_guess(addition: String):
	AudioManager.create_audio_with_variance(SFXSettings.SOUND_EFFECT_LABEL.KeypadPress, Vector2(0.5,2))
	current_user_guess += addition

func check_current_guess():
	var check = password == current_user_guess
	current_user_guess = ""
	return check

func add_to_dial(addition: String):
	current_dial += addition

func check_dial_length():
	return len(current_dial) == 10

func check_dial():
	var check = current_dial == bank_number
	current_dial = ""
	return check
