extends Node2D

var _starting_position = Vector2(960, 950)

var _move_speed : float = 250
var _move_speed_slow : float = 150
var _move_speed_normal : float = 300

var _rotation_speed : float = 1.5
var _rotation_speed_slow : float = 0.4
var _rotation_speed_normal : float = 1.5
var _slow_mode : bool

func _process(delta: float) -> void:
	move_ruler(delta)


func move_ruler(delta):
	if Navigator.can_draw:
			#region SLOW MODE
		if Input.is_action_pressed("slow_mode"):
			_slow_mode = true
			_rotation_speed = _rotation_speed_slow
			_move_speed = _move_speed_slow
		else:
			_slow_mode = false
			_rotation_speed = _rotation_speed_normal
			_move_speed = _move_speed_normal
	#endregion
	
		if Navigator.is_map_open == true:
			if Input.is_action_pressed("move_forward") and global_position.y > 0:
				global_position.y -= _move_speed * delta
			if Input.is_action_pressed("move_back") and global_position.y < 1080:
				global_position.y += _move_speed * delta
			if Input.is_action_pressed("move_left") and global_position.x > 0:
				global_position.x -= _move_speed * delta
			if Input.is_action_pressed("move_right") and global_position.x < 1920:
				global_position.x += _move_speed * delta
				
			if Input.is_action_pressed("rotate_left"):
				rotation_degrees -= _rotation_speed
			if Input.is_action_pressed("rotate_right"):
				rotation_degrees += _rotation_speed
		
func _input(_event: InputEvent) -> void:
	if Navigator.can_draw:
		if Navigator.is_map_open == true:
			if Input.is_action_just_pressed("camera_reset"):
				reset_ruler()
			if Input.is_action_just_pressed("r") and visible == true:
				visible = false
			elif Input.is_action_just_pressed("r") and visible == false:
				visible = true
	if Input.is_action_just_pressed("map_toggle") and Navigator.is_map_open == false:
		visible = true

			
func reset_ruler():
		rotation_degrees = 0
		global_position = _starting_position
