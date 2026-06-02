extends Node

var mapID = 1
var mapExitID = 1
var chosenTrial = 0
var bytes = 5
var maxBytes = 5
var enemyHP = 500
var actionType = ""
var enemyType = ""
var attackName = ""
var ownProtogentPunch = false
signal _fade
signal _stopMovement
signal _combatStart
signal _combatEnd
signal _combatChoice
signal _attackTrial
signal _tacticsTrial
signal _notEnough
signal _playerAttack
signal _enemyAttack

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass
