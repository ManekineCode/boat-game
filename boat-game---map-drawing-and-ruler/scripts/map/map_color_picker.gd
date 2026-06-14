extends GridContainer


func _on_button_pressed() -> void:
	Navigator.map_drawing_color = Color(0.749, 0.035, 0.184, 1.0)


func _on_button_2_pressed() -> void:
	Navigator.map_drawing_color = Color(0.075, 0.141, 0.251, 1.0)


func _on_button_3_pressed() -> void:
	Navigator.map_drawing_color = Color(0.086, 0.278, 0.416, 1.0)


func _on_button_4_pressed() -> void:
	Navigator.map_drawing_color = Color(0.231, 0.592, 0.592, 1.0)
