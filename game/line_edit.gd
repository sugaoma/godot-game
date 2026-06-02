extends LineEdit

signal _response

func _ready() -> void:
	editable = false
	hide()
	Global._playerAttack.connect(_on_playerAttack)
	Global._enemyAttack.connect(_on_enemyAttack)
	Global._attackTrial.connect(_on_attackTrial)
	pass

func _process(delta: float) -> void:
	pass


func _on_attackTrial():
	clear()
	editable = true
	if Global.chosenTrial == 1:
		position = Vector2(186, 53)
		show()
	elif Global.chosenTrial == 2:
		position = Vector2(-41, 197.5)
		show()

func _on_text_submitted(new_text: String) -> void:
	editable = false
	_response.emit(text)
	pass

func _on_playerAttack():
	hide()
	
func _on_enemyAttack():
	hide()
