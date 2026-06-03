extends CharacterBody2D
#Protogent Sprite in Overworld
var walkSound = false

var movementState = "Enabled"
var speed = 300

func _ready():
	$AudioStreamPlayer2.play()
	Global._stopMovement.connect(_on_stopMovement)
	Global._combatStart.connect(_on_combatStart)
	Global._combatEnd.connect(_on_combatEnd)
	$Sprite2D.hide()
	position = Vector2(0, 0)
	$Sprite2D.show()
	pass
		
func _process(_delta: float) -> void:
	pass
	
func _physics_process(_delta):
	if not movementState == "Disabled":
		var movementDirection = Input.get_vector("move_left", "move_right", "move_up", "move_down") 
		velocity = movementDirection * speed
		move_and_slide()
	
		if movementDirection.length() > 0:
			play_walk_animation(movementDirection)
		else:
			play_idle_animation()
	
func play_walk_animation(movementDirection):
	play_walk_sound()
	if movementDirection.x > 0:
		$Sprite2D.flip_h = true
		$AnimationPlayer.play("Walk")
	elif movementDirection.x < 0:
		$Sprite2D.flip_h = false
		$AnimationPlayer.play("Walk")
	elif movementDirection.y > 0:
		$AnimationPlayer.play("Walk")
	elif movementDirection.y < 0:
		$AnimationPlayer.play("Walk")

func play_idle_animation():
	$AudioStreamPlayer.stop()
	walkSound = false
	$AnimationPlayer.play("Idle")

func play_walk_sound():
	if walkSound == false:
		walkSound = true
		$AudioStreamPlayer.play()

func _on_canvas_layer__scene_change() -> void:
	movementState = "Enabled"
	if Global.mapExitID == 1:
		position = Vector2(0, 0)
	elif Global.mapExitID == 2:
		position = Vector2(0, -550)
	elif Global.mapExitID == 3:
		position = Vector2(750, -200)
	elif Global.mapExitID == 4:
		position = Vector2(-750, -200)
	pass

func _on_stopMovement():
	movementState = "Disabled"
	pass
	
func _on_combatStart():
	$AudioStreamPlayer.stop()
	$AudioStreamPlayer2.stop()
	walkSound = false
	$AnimationPlayer.play("CombatStart")
	
func _on_combatEnd():
	$AudioStreamPlayer2.play()
	movementState = "Enabled"
