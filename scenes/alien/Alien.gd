extends KinematicBody2D

onready var health = 1
onready var animationPlayer := $AnimationPlayer
onready var Bullet = load("res://scenes/bullet/Bullet.tscn")

var bullet_timer

func _init():
	bullet_timer = Timer.new()
	add_child(bullet_timer)
	
	bullet_timer.autostart = true
	bullet_timer.wait_time = 1
	bullet_timer.connect("timeout", self, "_bullet_timeout")

func _bullet_timeout():
	var total_aliens = get_parent().get("total_aliens")

	if total_aliens <= 0:
		return

	# @info: random chance of firing based on total amount of aliens on the screen
	if randi() % total_aliens == 0:
		shoot()

func shoot():
	var bullet = Bullet.instance()

	bullet.set_collision_layer(16)
	bullet.set_collision_mask(4)
	bullet.get_node("Sprite").modulate = Color("f5350f")

	bullet.position = position
	bullet.shoot("down")

	get_parent().add_child(bullet)

func take_damage(amount: int):
	health -= amount

	if health <= 0:
		die()

func die():
	animationPlayer.play("Death")

	if (get_parent().has_method('add_score')):
		get_parent().add_score()

	yield(get_tree().create_timer(0.25), "timeout")
	queue_free()
