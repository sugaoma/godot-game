extends TextureButton

func _ready() -> void:
	hide()
	Global._combatChoice.connect(_on_combatChoice)
	Global._attackTrial.connect(_on_attackTrial)
	Global._tacticsTrial.connect(_on_tacticsTrial)
	pass

func _process(delta: float) -> void:
	pass

func _on_button_down() -> void:
	hide()
	$AudioStreamPlayer.play()
	Global.actionType = ""
	Global._combatChoice.emit()

func _on_combatChoice():
	if not Global.actionType == "":
		show()
	else:
		hide()
	pass

func _on_attackTrial():
	hide()

func _on_tacticsTrial():
	hide()
