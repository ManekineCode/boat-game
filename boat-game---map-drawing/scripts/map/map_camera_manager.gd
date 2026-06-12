extends Node2D

var is_panning = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and is_panning:
		global_position += event.relative

	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_MIDDLE:
			#is_panning = true
		#else:
			#is_panning = false
	if Input.is_action_pressed("middle_mouse_button"):
		is_panning = true
	elif Input.is_action_just_released("middle_mouse_button"):
		is_panning = false
		
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			$MapCamera.zoom += Vector2(0.02, 0.02)
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN and $MapCamera.zoom != Vector2(1.0, 1.0):
			$MapCamera.zoom -= Vector2(0.02, 0.02)
			
	if Input.is_action_just_pressed("map_toggle"):
		$MapCamera.zoom = Vector2.ONE
