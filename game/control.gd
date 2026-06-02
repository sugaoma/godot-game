extends Control

var tween = create_tween()

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	hide()
	Global._combatStart.connect(_on_combatStart)
	Global._combatEnd.connect(_on_combatEnd)
	pass

func _process(delta: float) -> void:
	pass

func _on_combatStart():
	if Global.enemyType == "Smiling Virus":
		Global.enemyHP = 500
	process_mode = Node.PROCESS_MODE_INHERIT
	await get_tree().create_timer(2).timeout
	tween = create_tween()
	scale = Vector2(0.01, 0.01)
	show()
	tween.tween_property(self, "scale", Vector2(1, 1), 0.5)
	pass

func _on_combatEnd():
	await get_tree().create_timer(1.5).timeout
	tween = create_tween()
	tween.tween_property(self, "scale", Vector2(0.01, 0.01), 0.5)
	await tween.finished
	hide()
	pass
