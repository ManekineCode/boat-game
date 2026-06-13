extends Node2D
@onready var _lines: Node2D = $Line2D
var _drawing: bool = false
var _erasing: bool = false
var _current_line: Line2D = null

const ERASE_RADIUS = 10.0

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			_drawing = event.pressed
			if _drawing:
				_current_line = Line2D.new()
				_current_line.default_color = Navigator.map_drawing_color
				_current_line.width = 2
				_lines.add_child(_current_line)
				_current_line.add_point(get_local_mouse_position())

		elif event.button_index == MOUSE_BUTTON_RIGHT:
			_erasing = event.pressed
			if _erasing:
				erase_line(get_local_mouse_position())

	elif event is InputEventMouseMotion:
		if _drawing:
			_current_line.add_point(get_local_mouse_position())
		elif _erasing:
			erase_line(get_local_mouse_position())

func erase_line(mouse_pos: Vector2) -> void:
	for line in _lines.get_children():
		for point in line.points:
			if point.distance_to(mouse_pos) < ERASE_RADIUS:
				line.queue_free()
				return
