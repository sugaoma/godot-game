extends Area2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	

func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		if Global.mapID == 2:
			Global.mapID = 1
		if Global.mapID == 4:
			Global.mapID = 2
		Global.mapExitID = 2
		Global._fade.emit()
		Global._stopMovement.emit()
	pass

func _on_canvas_layer__scene_change() -> void:
	if Global.mapID == 2 or Global.mapID == 4:
		$CollisionShape2D.disabled = false
	else:
		$CollisionShape2D.disabled = true
	pass
