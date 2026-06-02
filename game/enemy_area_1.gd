extends Area2D

var enemyClearedMap4 = false

func _ready() -> void:
	Global._combatEnd.connect(_on_combatEnd)
	$Sprite2D.hide()
	$CollisionShape2D.disabled = true
	pass

func _process(delta: float) -> void:
	pass
	
func _play_idle_animation():
	$AnimationPlayer.play("Idle")

func _on_canvas_layer__scene_change() -> void:
	if Global.mapID == 4 and enemyClearedMap4 == false:
		$Sprite2D.show()
		$CollisionShape2D.disabled = false
		position = Vector2(0, 0)
		_play_idle_animation()
	else:
		$Sprite2D.hide()
		$CollisionShape2D.disabled = true
	pass


func _on_body_entered(body):
	Global.enemyType = "Smiling Virus"
	Global._stopMovement.emit()
	Global._combatStart.emit()
	pass

func _on_combatEnd():
	hide()
	if Global.mapID == 4:
		enemyClearedMap4 = true
