extends Marker3D
	
func _input(_event: InputEvent) -> void:
	if Navigator.is_map_open == false:
		if Input.is_action_just_pressed("1"):
			Navigator.new_runestone_placed.emit(Vector3(global_position.x, 0, global_position.z))
			Navigator.despawn_previous_runestone.emit()
