extends Node2D

export (PackedScene) var Mob
var score

func _ready():
	randomize()
	
func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	
func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
