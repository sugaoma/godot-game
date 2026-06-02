extends CanvasLayer


func _ready() -> void:
	$Control.hide()
	Global._combatStart.connect(_on_combatStart)
	pass


func _process(delta: float) -> void:
	pass

func _on_combatStart():
	await get_tree().create_timer(2).timeout
	$Control.show()
	pass
