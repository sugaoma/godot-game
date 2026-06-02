extends TextureButton

func _ready() -> void:
	hide()
	Global._combatChoice.connect(_on_combatChoice)
	pass

func _process(delta: float) -> void:
	pass


func _on_button_down() -> void:
	hide()
	$AudioStreamPlayer.play()
	if Global.maxBytes > 3:
		Global.maxBytes -= 1
	Global.bytes = Global.maxBytes
	Global.attackName = "Recycle"
	Global._tacticsTrial.emit()
	pass

func _on_combatChoice():
	if Global.actionType == "Tactics":
		show()
		$TextureRect.hide()
	else:
		hide()
	pass

func _on_mouse_entered() -> void:
	$TextureRect.show()
	pass


func _on_mouse_exited() -> void:
	$TextureRect.hide()
	pass
