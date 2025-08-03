extends Node

var vent_room_load = load("res://ROOMS/vent_room.tscn") as PackedScene
var outside_load = load("res://ROOMS/Outside.tscn") as PackedScene
var main_load = load("res://MAIN/Main.tscn") as PackedScene

func goto_scene(scene: PackedScene, starting_spot: String):
	var current_scene = get_tree().current_scene
	
	if current_scene.has_method("fade_out"):
		current_scene.fade_out()
		await current_scene.transition_player.animation_finished # Wait till it fades out
		
	deferred_goto_scene.call_deferred(scene, starting_spot)
	
	current_scene = get_tree().current_scene

	
func deferred_goto_scene(scene: PackedScene, starting_spot: String):
	var new_scene = scene.instantiate()
	
	if starting_spot != "":
		new_scene.set_player_location(starting_spot)
	
	var tree_ref = get_tree()
		
	tree_ref.root.get_child(-1).free()
	
	tree_ref.root.add_child(new_scene)
	tree_ref.current_scene = new_scene
