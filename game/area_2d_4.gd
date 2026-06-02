extends Area2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	

func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		if Global.mapID == 3:
			Global.mapID = 2
		if Global.mapID == 5:
			Global.mapID = 4
		Global.mapExitID = 4
		Global._fade.emit()
		Global._stopMovement.emit()
	pass

func _on_canvas_layer__scene_change() -> void:
	if Global.mapID == 3 or Global.mapID == 5:
		$CollisionShape2D.disabled = false
	else:
		$CollisionShape2D.disabled = true
	pass
