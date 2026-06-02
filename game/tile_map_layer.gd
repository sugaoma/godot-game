extends TileMapLayer
class_name MapChange
var chosenPattern = 0
var placement = Vector2(1, 0)

func _ready() -> void:
	chosenPattern = tile_set.get_pattern(0)
	set_pattern(placement, chosenPattern)
	pass

func _process(delta: float) -> void:
	pass

func _on_canvas_layer__scene_change() -> void:
	clear()
	if Global.mapID == 1:
		placement = Vector2(1, 0)
		chosenPattern = tile_set.get_pattern(0)
	elif Global.mapID == 2:
		placement = Vector2(0, 0)
		chosenPattern = tile_set.get_pattern(1)
	elif Global.mapID == 3:
		placement = Vector2(1, 0)
		chosenPattern = tile_set.get_pattern(2)
	elif Global.mapID == 4:
		placement = Vector2(0, 0)
		chosenPattern = tile_set.get_pattern(3)
	
	set_pattern(placement, chosenPattern)
	pass
