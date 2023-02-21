extends KinematicBody2D

var direction = Vector2.ZERO

export var damage_amount = 1

func shoot(bullet_direction):
	if bullet_direction == "up":
		direction.y = -GameState.BULLET_SPEED
	elif bullet_direction == "down":
		direction.y = GameState.BULLET_SPEED
	else:
		direction.y = -GameState.BULLET_SPEED

func _physics_process(delta):
	var collision = move_and_collide(direction * delta)

	if collision && collision.collider.has_method('take_damage'):
		collision.collider.take_damage(damage_amount)
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
