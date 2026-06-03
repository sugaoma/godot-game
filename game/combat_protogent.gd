extends Sprite2D
#Protogent Sprite During Combat

var tween = create_tween()

func _ready() -> void:
	$RichTextLabel.hide()
	Global._playerAttack.connect(_on_playerAttack)
	Global._enemyAttack.connect(_on_enemyAttack)
	Global._combatStart.connect(_on_combatStart)
	flip_h = true
	pass


func _process(delta: float) -> void:
	pass

func _on_combatStart():
	flip_h = true
	position = Vector2(-16, 648.5)
	$AnimationPlayer.play("Protogent Combat Idle")

func _on_playerAttack():
	tween = create_tween()
	if Global.attackName == "Block":
		$AnimationPlayer.play("Protogent Combat Punch")
		await get_tree().create_timer(1.2).timeout
		$AnimationPlayer.play("Protogent Combat Idle")
	elif Global.attackName == "Protogent Punch":
		$AnimationPlayer.play("Protogent Combat Walk")
		$AudioStreamPlayer2.play()
		tween.tween_property(self, "position", Vector2(800, 648.5), 0.8)
		await tween.finished
		$AudioStreamPlayer2.stop()
		$AnimationPlayer.play("Protogent Combat Punch")
		await get_tree().create_timer(0.6).timeout
		$AudioStreamPlayer.play()
		await get_tree().create_timer(0.3).timeout
		flip_h = false
		$AnimationPlayer.play("Protogent Combat Walk")
		$AudioStreamPlayer2.play()
		tween = create_tween()
		tween.tween_property(self, "position", Vector2(-16, 648.5), 0.8)
		await tween.finished
		$AudioStreamPlayer2.stop()
		$AnimationPlayer.play("Protogent Combat Idle")
		flip_h = true
		
func _on_enemyAttack():
	await get_tree().create_timer(2.3).timeout
	$AnimationPlayer.play("Protogent Combat Hurt")
	$RichTextLabel.show()
	tween = create_tween()
	tween.tween_property(self, "position", Vector2(-66, 648.5),0.2)
	await tween.finished
	tween = create_tween()
	tween.tween_property(self, "position", Vector2(34, 648.5),0.2)
	await tween.finished
	tween = create_tween()
	tween.tween_property(self, "position", Vector2(-16, 648.5),0.2)
	await tween.finished
	$RichTextLabel.hide()
	$AnimationPlayer.play("Protogent Combat Idle")
	Global.actionType = ""
	Global._combatChoice.emit()
