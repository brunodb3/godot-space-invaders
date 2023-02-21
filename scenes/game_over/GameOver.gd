extends Control

onready var scoreLabel := $"%Score"

func _ready():
	$"%PlayAgainButton".grab_focus()
	$"%Score".text = str("Score: ", GameState.SCORE)

func _on_PlayAgainButton_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/levels/level_01/Level_01.tscn")

func _on_ExitButton_pressed():
	# warning-ignore:return_value_discarded
	get_tree().change_scene("res://scenes/title/Title.tscn")
