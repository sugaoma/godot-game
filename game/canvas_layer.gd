extends CanvasLayer
var tween = create_tween()

signal _sceneChange

func _ready() -> void:
	$RichTextLabel.hide()
	$RichTextLabel.modulate.a = 0
	Global._fade.connect(_on_fade)
	$ColorRect.show()
	await get_tree().create_timer(0.5).timeout
	_sceneChange.emit()
	$AnimationPlayer.play("Fade")
	$ColorRect.color.a = 1
	pass

func _process(delta: float) -> void:
	pass

func _on_fade() -> void:
	$AnimationPlayer.play_backwards("Fade")
	await get_tree().create_timer(2).timeout
	if not Global.mapID == 7:
		_sceneChange.emit()
		$AnimationPlayer.play("Fade")
	else:
		$RichTextLabel.show()
		tween.tween_property($RichTextLabel, "modulate:a", 1, 0.5)
