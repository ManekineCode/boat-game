extends Node2D

var _starting_position = Vector2(640, 360)

func _process(delta: float) -> void:
	move_ruler(delta)


func move_ruler(delta):
	if Navigator.can_draw:
		if Navigator.can_control == false:
			if Input.is_action_pressed("move_forward") and global_position.y > 0:
				global_position.y -= 150 * delta
			if Input.is_action_pressed("move_back") and global_position.y < 720:
				global_position.y += 150 * delta
			if Input.is_action_pressed("move_left") and global_position.x > 0:
				global_position.x -= 150 * delta
			if Input.is_action_pressed("move_right") and global_position.x < 1280:
				global_position.x += 150 * delta
				
			if Input.is_action_pressed("rotate_left"):
				rotation_degrees -= .5
			if Input.is_action_pressed("rotate_right"):
				rotation_degrees += .5
		
func _input(_event: InputEvent) -> void:
	if Navigator.can_draw:
		if Navigator.can_control == false:
			if Input.is_action_just_pressed("camera_reset"):
				reset_ruler()
			if Input.is_action_just_pressed("r") and visible == true:
				visible = false
			elif Input.is_action_just_pressed("r") and visible == false:
				visible = true

			
func reset_ruler():
		rotation_degrees = 0
		global_position = _starting_position
