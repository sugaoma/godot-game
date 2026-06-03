extends PanelContainer

var computerProgress = 0
var coins = 0
var question = 0

func _ready() -> void:
	Global.chosenTrial = randi_range(1, 4)
	$Instruction.hide()
	Global._combatStart.connect(_on_combatStart)
	Global._combatEnd.connect(_on_combatEnd)
	Global._combatChoice.connect(_on_combatChoice)
	Global._attackTrial.connect(_on_attackTrial)
	Global._tacticsTrial.connect(_on_tacticsTrial)
	Global._playerAttack.connect(_on_playerAttack)
	Global._enemyAttack.connect(_on_enemyAttack)
	pass

func _process(delta: float) -> void:
	pass


func _on_attackTrial():
	question = randi_range(1, 4)
	while question == Global.chosenTrial:
		question = randi_range(1, 4)
	Global.chosenTrial = question
	if Global.chosenTrial == 1:
		$Instruction.text = " Set the Vector2 position to the coordinates 200, -200:\n\n\tfunc _ready():\n\t\tposition = Vector2(\t\t\t\t\t\t\t\t\t\t\t)\n\t\tpass"
	elif Global.chosenTrial == 2:
		$Instruction.text = " Set the child Sprite2D visibility to hidden using $:\n\n\tfunc _ready():\n\t\t$Sprite2D.show()\n\t\tpass\n\n\tfunc _on_my_signal():\n\n\t\tpass"
	elif Global.chosenTrial == 3:
		$Instruction.text = " Set the flip_h property of the sprite to be true:\n\n\tfunc _ready():\n\n\t\tpass"
	elif Global.chosenTrial == 4:
		$Instruction.text = " Emit the Message signal in the function:\n\n\tsignal Message\n\n\tfunc _ready():\n\n\t\tpass"
	$Instruction.show()

func _on_tacticsTrial():
	if Global.attackName == "Recycle":
		$Instruction.show()
		$Instruction.text = "[center]Protegent cleared the Recycle Bin and regained Bytes![/center]"
	
func _on_playerAttack():
	$Instruction.text = "[center]Protogent used %s on %s![/center]" % [Global.attackName, Global.enemyType]

func _on_enemyAttack():
	if Global.enemyType == "Smiling Virus":
		$Instruction.text = "[center]Smiling Virus used Idiot Blast on Protegent![/center]"

func _on_combatChoice():
	$Instruction.hide()

func _on_combatStart():
	$Instruction.hide()

func _on_combatEnd():
	$AudioStreamPlayer.play()
	coins = randi_range(5, 12)
	if computerProgress < 100:
		computerProgress += 50
	$Instruction.text = "[center]%s was deleted! The computer is %s%% clean!\n[color=green]$%s[/color] were added to your bank![/center]" % [Global.enemyType, computerProgress, coins]
	
