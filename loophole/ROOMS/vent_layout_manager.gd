extends Node
@onready var open_vent_layout: TileMapLayer = $"../OpenVentLayout"
@onready var closed_vent_layout: TileMapLayer = $"../ClosedVentLayout"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameState.loaded_save_data["vent_path"] <= 1:
		open_vent_layout.collision_enabled = true
		open_vent_layout.visible = true
		closed_vent_layout.collision_enabled = false
		closed_vent_layout.visible = false
	else:
		open_vent_layout.collision_enabled = false
		open_vent_layout.visible = false
		closed_vent_layout.collision_enabled = true
		closed_vent_layout.visible = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
