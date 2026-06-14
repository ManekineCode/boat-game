extends Node

@onready var _camera_axis = %CameraAxis

func _process(delta: float) -> void:
	control_camera(delta)
	
	
func control_camera(delta):
	if Navigator.can_control:
		if Input.is_action_pressed("rotate_left"):
			_camera_axis.rotation_degrees.y += 100 * delta
		elif Input.is_action_pressed("rotate_right"):
			_camera_axis.rotation_degrees.y -= 100 * delta
		elif Input.is_action_just_pressed("camera_reset"): #reset camera
			var ease_camera = get_tree().create_tween()
			ease_camera.tween_property(_camera_axis, "rotation", Vector3.ZERO, 0.5)
