extends TextureButton

func _ready() -> void:
	Global._combatStart.connect(_on_combatStart)
	Global._combatChoice.connect(_on_combatChoice)
	$TextureRect.hide()
	pass

func _process(delta: float) -> void:
	pass

func _on_combatStart():
	show()

func _on_mouse_entered():
	$TextureRect.show()
	
func _on_mouse_exited():
	$TextureRect.hide()

func _on_button_down():
	hide()
	$AudioStreamPlayer.play()
	Global.actionType = "Tactics"
	Global._combatChoice.emit()

func _on_combatChoice():
	if Global.actionType == "":
		show()
	else:
		hide()
