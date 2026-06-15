extends GridContainer

@export var label_text : String

func _ready() -> void:
	$Label.text = label_text
	$Label.set("theme_override_colors/font_color", Color.DODGER_BLUE)
