extends Control

func _ready() -> void:
	visible = false

func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("map_toggle") and visible == false and Navigator.is_adding_map_label == false:
		visible = true
		Navigator.is_map_open = true
		Navigator.can_draw = true
		
	elif Input.is_action_just_pressed("map_toggle") and visible == true and Navigator.is_adding_map_label == false:
		visible = false
		Navigator.is_map_open = false
		Navigator.can_draw = false
		
