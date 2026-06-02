extends Sprite2D

var tween = create_tween()

func _ready() -> void:
	Global._enemyAttack.connect(_on_enemyAttack)
	hide()
	$AnimationPlayer.play("Normal")
	pass

func _process(delta: float) -> void:
	pass

func _on_enemyAttack():
	await get_tree().create_timer(1).timeout
	show()
	modulate.a = 1
	position = Vector2(1059, 735)
	scale = Vector2(0.01, 0.01)
	tween = create_tween()
	tween.tween_property(self, "scale", Vector2(3, 3), 0.8)
	tween.tween_property(self, "position", Vector2(-16, 735), 0.5)
	await tween.finished
	tween = create_tween()
	$AudioStreamPlayer.play()
	tween.set_parallel(true)
	tween.tween_property(self, "scale", Vector2(4, 4), 0.3)
	tween.tween_property(self, "modulate:a", 0, 0.3)
	await tween.finished
	tween.set_parallel(false)
	hide()
