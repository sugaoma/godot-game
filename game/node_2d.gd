extends Node2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_full_screen_pressed():
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
