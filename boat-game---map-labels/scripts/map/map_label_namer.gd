extends LineEdit

var secondary_function_mode : bool = false # When CTRL is pressed, secondary mode is enabled
var _map_label_text = preload("uid://cjs7bmcsimxdr")
var _map_label_position : Vector2

func _ready() -> void:
	visible = false

func _input(event: InputEvent) -> void:
	# ctrl click enables "secondary function" mode, where adding label is possible
	if Input.is_action_pressed("ctrl") and Navigator.is_map_open == true:
		secondary_function_mode = true
	elif Input.is_action_just_released("ctrl"):
		secondary_function_mode = false
		
	# line edit appears
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and secondary_function_mode == true:
		Navigator.can_draw = false
		Navigator.is_adding_map_label = true
		visible = true
		_map_label_position = get_global_mouse_position() #this is where I'd like the label to appear
		grab_focus()
		
func create_new_label(mouse_pos : Vector2, label : StringName):
	var new_label = _map_label_text.instantiate()
	new_label.label_text = label
	get_parent().add_child(new_label)
	new_label.global_position = mouse_pos


func _on_text_submitted(new_text: String) -> void:
	if text == "":
		return
	else:
		create_new_label(_map_label_position, text) #_map _label_position is determined when CTRL-click happens
		text = ""
		Navigator.is_adding_map_label = false
		visible = false
		secondary_function_mode = false
		Navigator.can_draw = true
