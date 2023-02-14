extends YSort

onready var Alien = load("res://scenes/alien/Alien.tscn")

func _process(_delta):
	if Input.is_action_just_released("ui_pause"):
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/title/Title.tscn")

func _ready():
	for row in 3:
		for column in 12:
			var alien = Alien.instance()

			alien.position.x = (column + 1) * 150
			alien.position.y = (row + 1) * 150

			add_child(alien)
