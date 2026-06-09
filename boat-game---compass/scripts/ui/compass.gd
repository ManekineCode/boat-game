extends TextureRect

func _ready() -> void:
	$CompassAxis.rotation = 0
	
func _process(delta: float) -> void:
	$CompassAxis.rotation = Navigator.player_rotation_degree
	$TrackerAxis.rotation = -Navigator.tracker_axis_rotation
