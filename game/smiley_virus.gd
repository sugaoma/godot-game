extends Sprite2D
#Smiling Virus Enemy During Combat

var tween = create_tween()
var playerDamage = 0

func _ready() -> void:
	print(position)
	$RichTextLabel.hide()
	hide()
	Global._tacticsTrial.connect(_on_tacticsTrial)
	Global._enemyAttack.connect(_on_enemyAttack)
	Global._playerAttack.connect(_on_playerAttack)
	Global._combatStart.connect(_on_combatStart)
	Global._combatEnd.connect(_on_combatEnd)
	flip_h = true
	pass


func _process(delta: float) -> void:
	pass

func _on_combatStart():
	scale = Vector2(4.3, 4.3)
	if Global.enemyType == "Smiling Virus":
		show()
		$AnimationPlayer.play("Virus Idle")

func _on_playerAttack():
	if Global.attackName == "Block":
		playerDamage = randi_range(200, 250)
		Global.enemyHP -= playerDamage
		await get_tree().create_timer(1.4).timeout
		$AnimationPlayer.play("Virus Hurt")
		$RichTextLabel.text = "-%s" % [playerDamage]
		$RichTextLabel.show()
		await get_tree().create_timer(0.4).timeout
		$RichTextLabel.hide()
	elif Global.attackName == "Protogent Punch":
		playerDamage = randi_range(300, 350)
		Global.enemyHP -= playerDamage
		await get_tree().create_timer(1.3).timeout
		$AnimationPlayer.play("Virus Hurt")
		$RichTextLabel.text = "-%s" % [playerDamage]
		$RichTextLabel.show()
		for i in range(2):
			tween = create_tween()
			tween.tween_property(self, "position", Vector2(1008, 653.5),0.2)
			await tween.finished
			tween = create_tween()
			tween.tween_property(self, "position", Vector2(1108, 653.5),0.2)
			await tween.finished
		position = Vector2(1058, 653.5)
		$RichTextLabel.hide()
	if Global.enemyHP <= 0:
		await get_tree().create_timer(1).timeout
		Global._combatEnd.emit()
	else:
		$AnimationPlayer.play("Virus Idle")
		await get_tree().create_timer(1).timeout
		Global._enemyAttack.emit()

func _on_enemyAttack():
	$AudioStreamPlayer.play()
	$AnimationPlayer.play("Virus Attack")
	await get_tree().create_timer(2.2).timeout
	$AnimationPlayer.play("Virus Idle")
	await get_tree().create_timer(1.4).timeout
	$AudioStreamPlayer.stop()

func _on_combatEnd():
	tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.01, 0.01), 0.5)
	await tween.finished
	hide()

func _on_tacticsTrial():
	await get_tree().create_timer(1.5).timeout
	Global._enemyAttack.emit()
