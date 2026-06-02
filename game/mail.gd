extends TextureButton

signal messageProtogentPunch

func _ready() -> void:
	$TextureRect.hide()
	pass


func _process(delta: float) -> void:
	pass


func _on_canvas_layer__scene_change() -> void:
	if Global.mapID == 3:
		position = Vector2(867.5, 446.5)
		show()
	else:
		hide()
	pass

func _on_mouse_entered():
	if Global.ownProtogentPunch == false:
		$TextureRect.show()


func _on_mouse_exited():
	$TextureRect.hide()


func _on_toggled(toggled_on: bool) -> void:
	$AudioStreamPlayer.play()
	if toggled_on:
		Global.ownProtogentPunch = true
		messageProtogentPunch.emit()
		$TextureRect.hide()
	pass
