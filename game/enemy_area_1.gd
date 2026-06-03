extends Area2D

var enemyClearedMap4 = false
var enemyClearedMap6 = false

func _ready() -> void:
	enemyClearedMap4 = false
	enemyClearedMap6 = false
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
		position = Vector2(0, 0)
		await get_tree().create_timer(0.1).timeout
		$Sprite2D.show()
		$CollisionShape2D.disabled = true
		_play_idle_animation()
	elif Global.mapID == 6 and enemyClearedMap6 == false:
		position = Vector2(487, -360)
		await get_tree().create_timer(0.1).timeout
		$Sprite2D.show()
		$CollisionShape2D.disabled = true
		_play_idle_animation()
	else:
		$Sprite2D.hide()
		$CollisionShape2D.disabled = true
	pass


func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		$AudioStreamPlayer.play()
		Global.enemyType = "Smiling Virus"
		Global._stopMovement.emit()
		Global._combatStart.emit()
	pass

func _on_combatEnd():
	$Sprite2D.hide()
	$CollisionShape2D.disabled = true
	if Global.mapID == 4:
		enemyClearedMap4 = true
	if Global.mapID == 6:
		enemyClearedMap6 = true
