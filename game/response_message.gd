extends ColorRect

var correctCheck = false

func _ready() -> void:
	Global._combatStart.connect(_on_combatStart)
	Global._playerAttack.connect(_on_playerAttack)
	Global._enemyAttack.connect(_on_enemyAttack)
	Global._notEnough.connect(_on_notEnough)
	hide()
	pass


func _process(delta: float) -> void:
	pass

func _on_combatStart():
	hide()

func _on_line_edit__response(lineText) -> void:
	lineText = lineText.replace(" ", "")
	lineText = lineText.to_lower()
	show()
	if Global.chosenTrial == 1:
		if lineText == "200,-200":
			correctCheck = true
		else:
			correctCheck = false
	elif Global.chosenTrial == 2:
		if lineText == "$sprite2d.hide()":
			correctCheck = true
		else:
			correctCheck = false
	if correctCheck == true:
		$RichTextLabel.text = "[center][color=green]Correct![/color][/center]"
		await get_tree().create_timer(2).timeout
		Global._playerAttack.emit()
	else:
		$RichTextLabel.text = "[center][color=red]Incorrect![/color][/center]"
		await get_tree().create_timer(2).timeout
		Global._enemyAttack.emit()
	pass

func _on_notEnough():
	show()
	$RichTextLabel.text ="[center]Not enough bytes! Use Recycle to get more bytes![/center]"
	await get_tree().create_timer(1).timeout
	hide()
	
func _on_playerAttack():
	hide()
	
func _on_enemyAttack():
	hide()
