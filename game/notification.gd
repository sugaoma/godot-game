extends ColorRect

func _ready() -> void:
	hide()
	pass

func _process(delta: float) -> void:
	pass

func _on_mail_message_protogent_punch() -> void:
	$RichTextLabel.text = "[center][b]Attack: Protegent Punch Obtained! You can now use it in combat![/b][/center]"
	show()
	await get_tree().create_timer(4).timeout
	hide()
	pass


func _on_usb_increase_max_bytes() -> void:
	$RichTextLabel.text = "[center][b]Purchased Small USB for [color=green]$5[/color]! Max Bytes increased by 1![/b][/center]"
	show()
	await get_tree().create_timer(4).timeout
	hide()
	pass
