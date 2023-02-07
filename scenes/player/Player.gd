extends KinematicBody2D

var direction = Vector2.ZERO

func check_input():
	if Input.is_action_pressed("player_left"):
		direction.x = -GameState.player_speed
	elif Input.is_action_pressed("player_right"):
		direction.x = GameState.player_speed
	else:
		direction.x = 0

func _physics_process(delta):
	check_input()

	var collision = move_and_collide(direction * delta)

	if collision && collision.normal.x != 0:
		direction.x = 0
