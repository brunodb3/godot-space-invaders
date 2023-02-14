extends KinematicBody2D

var direction = Vector2.ZERO

func shoot():
	direction.y = -GameState.PLAYER_SPEED

func _physics_process(delta):
	var collision = move_and_collide(direction * delta)
	
	if collision:
		collision.collider.queue_free()
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
