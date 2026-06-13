extends Control

func _ready() -> void:
	visible = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("map_toggle") and visible == false:
		visible = true
	elif Input.is_action_just_pressed("map_toggle") and visible == true:
		visible = false
