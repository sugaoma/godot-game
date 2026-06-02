extends TextureButton

func _ready() -> void:
	hide()
	Global._combatChoice.connect(_on_combatChoice)
	Global._attackTrial.connect(_on_attackTrial)
	pass

func _process(delta: float) -> void:
	pass

func _on_button_down() -> void:
	if Global.bytes >= 3:
		hide()
		Global.bytes -= 3
		Global.actionType = ""
		Global.attackName = "Protogent Punch"
		Global._attackTrial.emit()
	else:
		$AudioStreamPlayer.play()
		Global._notEnough.emit()

func _on_combatChoice():
	if Global.actionType == "Attack" and Global.ownProtogentPunch == true:
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

func _on_attackTrial():
	hide()
