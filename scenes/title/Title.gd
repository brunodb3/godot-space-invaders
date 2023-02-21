extends Control

func _ready():
	$"%StartGameButton".grab_focus()

func _on_StartGameButton_pressed():
	# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/levels/level_01/Level_01.tscn")

func _on_SourceCodeButton_pressed():
	# warning-ignore:return_value_discarded
	OS.shell_open("https://github.com/brunodb3/godot-space-invaders")
