extends Control

func _ready() -> void:
	visible = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("map_toggle") and visible == false:
		visible = true
		Navigator.can_control = false
		Navigator.can_draw = true
		
	elif Input.is_action_just_pressed("map_toggle") and visible == true:
		visible = false
		Navigator.can_control = true
		Navigator.can_draw = false
		
