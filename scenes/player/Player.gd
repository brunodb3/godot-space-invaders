extends KinematicBody2D

var bullet_cooldown = 0
var direction = Vector2.ZERO

onready var health = 3
onready var Bullet = load("res://scenes/bullet/Bullet.tscn")

func _physics_process(delta):
	check_input()
	move(delta)

func check_input():
	# @info: movement input
	if Input.is_action_pressed("player_left"):
		direction.x = -GameState.PLAYER_SPEED
	elif Input.is_action_pressed("player_right"):
		direction.x = GameState.PLAYER_SPEED
	else:
		direction.x = 0

	# @info: attack input
	if Input.is_action_pressed("player_shoot"):
		if bullet_cooldown > 0:
			bullet_cooldown -= 1
		elif bullet_cooldown == 0:
			bullet_cooldown = GameState.BULLET_COOLDOWN
			shoot()

	if Input.is_action_just_released("player_shoot"):
		bullet_cooldown = 0

func move(delta):
	var collision = move_and_collide(direction * delta)

	if collision && collision.normal.x != 0:
		direction.x = 0

func shoot():
	var bullet = Bullet.instance()
	
	bullet.set_collision_layer(2)
	bullet.set_collision_mask(8)
	bullet.get_node("Sprite").modulate = Color("00b7ef")

	bullet.position = position
	bullet.shoot("up")

	get_parent().add_child(bullet)

func take_damage(amount: int):
	health -= amount

	get_parent().livesLabel.text = str("Lives: ", health)

	if health <= 0:
		die()

func die():
	get_tree().change_scene("res://scenes/game_over/GameOver.tscn")
