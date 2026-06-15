extends LineEdit

var extra_function_mode : bool = false
var _map_label_text = preload("uid://cjs7bmcsimxdr")
var _map_label_position : Vector2

func _ready() -> void:
	visible = false

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("ctrl") and Navigator.can_control == false:
		extra_function_mode = true
	elif Input.is_action_just_released("ctrl"):
		extra_function_mode = false
		
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and extra_function_mode == true:
		Navigator.can_draw = false
		visible = true
		_map_label_position = get_local_mouse_position()
		print(_map_label_position)
		grab_focus()
		
func create_new_label(mouse_pos : Vector2, label : StringName):
	var new_label = _map_label_text.instantiate()
	new_label.label_text = label
	new_label.global_position = mouse_pos
	%SubViewport.add_child(new_label)


func _on_text_submitted(new_text: String) -> void:
	if text == "":
		return
	else:
		create_new_label(_map_label_position, text)
		text = ""
		visible = false
		extra_function_mode = false
		Navigator.can_draw = true
		print(_map_label_position)
