extends PanelContainer

func _ready() -> void:
	Global._combatStart.connect(_on_combatStart)
	Global._attackTrial.connect(_on_attackTrial)
	Global._tacticsTrial.connect(_on_tacticsTrial)
	pass

func _process(delta: float) -> void:
	pass

func _on_combatStart():
	Global.bytes = Global.maxBytes
	$RichTextLabel.text = "[center][color=blue]%s/%s Bytes[/color][/center]" % [Global.bytes, Global.maxBytes]

func _on_attackTrial():
	$RichTextLabel.text = "[center][color=blue]%s/%s Bytes[/color][/center]" % [Global.bytes, Global.maxBytes]

func _on_tacticsTrial():
	$RichTextLabel.text = "[center][color=blue]%s/%s Bytes[/color][/center]" % [Global.bytes, Global.maxBytes]
