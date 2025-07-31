extends Node


func goto_scene(scene: PackedScene, starting_spot: String):
	deferred_goto_scene.call_deferred(scene, starting_spot)

func deferred_goto_scene(scene: PackedScene, starting_spot: String):
	var new_scene = scene.instantiate()
	
	if starting_spot != "":
		new_scene.set_player_location(starting_spot)
	
	var tree_ref = get_tree()
		
	tree_ref.root.get_child(-1).free()
	
	tree_ref.root.add_child(new_scene)
	tree_ref.current_scene = new_scene
