extends TextureRect

func _ready() -> void:
	$CompassAxis.rotation = 0
	
func _process(_delta: float) -> void:
	$CompassAxis.rotation = Navigator.player_rotation_degree
	$TrackerAxis.rotation = -Navigator.runestone_axis_rotation
