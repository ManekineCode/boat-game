extends Marker3D

func _physics_process(_delta: float) -> void:
	look_at(Vector3(Navigator.runestone_position.x, 0, Navigator.runestone_position.z))
	Navigator.runestone_axis_rotation = rotation.y
