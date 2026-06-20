extends CanvasLayer



func _process(_delta: float) -> void:
	var _distance_to_runestone = int(Navigator.player_position.distance_to(Navigator.runestone_position))
	$Control/FPS.text = "FPS: " + str(Engine.get_frames_per_second())
	if _distance_to_runestone <= 500:
		$Control/TrackerDistance.text = "Tracker: " + str(_distance_to_runestone) + " m"
	else:
		$Control/TrackerDistance.text = "Tracker: ???"
