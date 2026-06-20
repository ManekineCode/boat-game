extends Node3D

func _ready() -> void:
	Navigator.current_runestone = self
	Navigator.runestone_position = Vector3(global_position.x, 0, global_position.z)
	
func despawn():
	if Navigator.current_runestone != self:
		queue_free()
		
		
func _enter_tree() -> void:
	Navigator.despawn_previous_runestone.connect(despawn)

func _exit_tree() -> void:
	Navigator.despawn_previous_runestone.disconnect(despawn)
