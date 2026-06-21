extends Node3D

@onready var _rune_stone_scene = preload("uid://d3ttw04p37lmh")		

func place_runestone(spawn_position : Vector3):
	var new_runestone = _rune_stone_scene.instantiate()
	add_child(new_runestone)
	new_runestone.global_position = spawn_position
	Navigator.current_runestone = new_runestone
	Navigator.runestone_position = spawn_position

func _enter_tree() -> void:
	Navigator.new_runestone_placed.connect(place_runestone)
	
func _exit_tree() -> void:
	Navigator.new_runestone_placed.disconnect(place_runestone)
