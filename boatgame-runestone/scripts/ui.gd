extends CanvasLayer

func _process(_delta: float) -> void:
	$Control/FPS.text = "FPS: " + str(Engine.get_frames_per_second())
	$Control/TrackerDistance.text = "Tracker: " + str(int(Navigator.player_position.distance_to(Navigator.runestone_position))) + " m"
