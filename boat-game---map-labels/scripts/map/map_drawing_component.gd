extends Node2D
@onready var _lines: Node2D = $Line2D
var _drawing: bool = false
var _erasing: bool = false
var _current_line: Line2D = null

const ERASE_RADIUS = 3.0

func _process(_delta: float) -> void:
	# If drawing got disabled externally, reset state
	if not Navigator.can_draw and (_drawing or _erasing):
		_drawing = false
		_erasing = false
		_current_line = null

func _input(event: InputEvent) -> void:
	if Navigator.can_draw:
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
	if Navigator.can_draw:
		for line in _lines.get_children():
			for point in line.points:
				if point.distance_to(mouse_pos) < ERASE_RADIUS:
					line.queue_free()
					return
