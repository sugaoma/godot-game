extends TextureRect

var tween = create_tween()

func _ready() -> void:
	hide()
	Global._playerAttack.connect(_on_playerAttack)
	pass

func _process(delta: float) -> void:
	pass

func _on_playerAttack():
	if Global.attackName == "Block":
		await get_tree().create_timer(1.2).timeout
		position = Vector2(757, -500)
		modulate.a = 1
		show()
		tween = create_tween()
		tween.tween_property(self, "position", Vector2(757, 450), 0.2)
		tween.tween_property(self, "modulate:a", 0.0, 0.4)
		await tween.finished
		hide()
