extends Marker3D

func _ready() -> void:
	Navigator.tracker_position.x = global_position.x
	Navigator.tracker_position.z = global_position.z
