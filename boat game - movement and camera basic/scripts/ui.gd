extends CanvasLayer

func _process(delta: float) -> void:
	$Control/FPS.text = "FPS: " + str(Engine.get_frames_per_second())
