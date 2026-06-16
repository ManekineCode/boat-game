extends Marker3D

func _physics_process(delta: float) -> void:
	look_at(Vector3(Navigator.tracker_position.x, 0, Navigator.tracker_position.z))
	Navigator.tracker_axis_rotation = rotation.y
