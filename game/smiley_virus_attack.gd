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
	position = Vector2(1059, 735)
	scale = Vector2(0.01, 0.01)
	tween = create_tween()
	tween.tween_property(self, "scale", Vector2(3, 3), 0.8)
	tween.tween_property(self, "position", Vector2(-500, 735), 0.8)
	await tween.finished
	hide()
