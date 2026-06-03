extends Area2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
	

func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		if Global.mapID == 1:
			Global.mapID = 2
		elif Global.mapID == 2:
			Global.mapID = 4
		elif Global.mapID == 5:
			Global.mapID = 6
		elif Global.mapID == 6:
			Global.mapID = 7
		Global.mapExitID = 1
		Global._fade.emit()
		Global._stopMovement.emit()
	pass

func _on_canvas_layer__scene_change() -> void:
	if Global.mapID == 1 or Global.mapID == 2 or Global.mapID == 5 or Global.mapID == 6:
		$CollisionShape2D.disabled = false
	else:
		$CollisionShape2D.disabled = true
	pass
