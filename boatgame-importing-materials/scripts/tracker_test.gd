extends Marker3D

func _ready() -> void:
	Navigator.current_runestone = self
	Navigator.runestone_position.x = global_position.x
	Navigator.runestone_position.z = global_position.z
