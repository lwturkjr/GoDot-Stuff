# Paddle Movement
extends KinematicBody2D

const BALL_SCENE = preload("res://Instanced Scenes/Ball.tscn")

var motion = Vector2()
export var max_movement_speed = 400
export var acceleration = 50

func _ready():
	set_physics_process(true)
	set_process_input(true)

func _physics_process(delta):
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x+acceleration, max_movement_speed)
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-acceleration, -max_movement_speed)
	else:
		friction = true
		motion.x = 0
	motion = move_and_slide(motion)

func _input(event):
	if event is InputEventKey and event.scancode == KEY_SPACE:
		var ball = BALL_SCENE.instance()
		ball.set_position(get_position()-Vector2(0, 16))
		get_tree().get_root().add_child(ball)