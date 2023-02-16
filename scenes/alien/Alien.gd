extends KinematicBody2D

onready var animationPlayer := $AnimationPlayer

func die():
	animationPlayer.play("Death")

	if (get_parent().has_method('add_score')):
		get_parent().add_score()

	yield(get_tree().create_timer(0.25), "timeout")
	queue_free()
