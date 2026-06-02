extends TextureButton

var usbMap5 = false
signal increaseMaxBytes

func _ready() -> void:
	$TextureRect.hide()
	pass

func _process(delta: float) -> void:
	pass


func _on_canvas_layer__scene_change() -> void:
	if Global.mapID == 5 and usbMap5 == false:
		position = Vector2(656, 582)
		show()
	else:
		hide()
	pass


func _on_toggled(toggled_on: bool) -> void:
	$AudioStreamPlayer.play()
	increaseMaxBytes.emit()
	if toggled_on:
		usbMap5 = true
		hide()
	pass


func _on_mouse_entered():
	$TextureRect.show()

func _on_mouse_exited():
	$TextureRect.hide()
