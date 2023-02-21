extends YSort

var level := 0
var total_aliens := 0

onready var player := $"%Player"
onready var livesLabel := $"%Lives"
onready var levelLabel := $"%Level"
onready var scoreLabel := $"%Score"
onready var levelClearLabel := $"%Level Cleared"
onready var Alien := load("res://scenes/alien/Alien.tscn")

func _process(_delta):
	if Input.is_action_just_released("ui_pause"):
		GameState.SCORE = 0
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/title/Title.tscn")

func _ready():
	reset()

func reset():
	delete_bullets()

	total_aliens = 0
	spawn_aliens()

	player.position.x = 960
	player.position.y = 960

	levelClearLabel.visible = false

	level += 1
	levelLabel.text = str("Level: ", level)

func add_score():
	total_aliens -= 1

	GameState.SCORE += GameState.ALIEN_SCORE
	scoreLabel.text = str("Score: ", GameState.SCORE)

	# @info: because the add_score is called from the alien script before it dies,
	# the size will be 1 and not 0
	if get_tree().get_nodes_in_group("ALIENS").size() == 1:
		levelClearLabel.visible = true
		player.health += 1
		livesLabel.text = str("Lives: ", player.health)
		yield(get_tree().create_timer(1), "timeout")
		reset()

func delete_bullets():
	if get_tree().get_nodes_in_group("BULLETS").size() > 0:
		for bullet in get_tree().get_nodes_in_group("BULLETS"):
			bullet.queue_free()

func spawn_aliens():
	for row in 3:
		for column in 12:
			var alien = Alien.instance()

			alien.position.x = (column + 1) * 150
			alien.position.y = (row + 1) * 150

			add_child(alien)
			total_aliens += 1
