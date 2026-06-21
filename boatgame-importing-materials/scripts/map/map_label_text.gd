extends GridContainer

@export var label_text : String

func _ready() -> void:
	
	$Label.text = label_text
	$Label.set("theme_override_colors/font_color", Color.ORANGE)
	$Label.set("theme_override_font_sizes/font_size", 18)
	$Label.set("theme_override_colors/font_outline_color", Color.BLACK)
	$Label.set("theme_override_constants/outline_size", 1)


func _on_button_pressed() -> void:
	queue_free()
