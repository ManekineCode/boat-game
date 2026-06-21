extends SpotLight3D

func _ready() -> void:
	visible = false

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("r") and Navigator.is_map_open == false:
		if visible == true:
			visible = false
		elif visible == false:
			visible = true
