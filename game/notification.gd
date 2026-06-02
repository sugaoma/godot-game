extends ColorRect

func _ready() -> void:
	hide()
	pass

func _process(delta: float) -> void:
	pass

func _on_mail_message_protogent_punch() -> void:
	$RichTextLabel.text = "[center][b]Attack: Protogent Punch Obtained! You can now use it in combat![/b][/center]"
	show()
	await get_tree().create_timer(4).timeout
	hide()
	pass
