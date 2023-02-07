extends YSort

func _process(_delta):
	if Input.is_action_just_released("ui_pause"):
		# warning-ignore:return_value_discarded
		get_tree().change_scene("res://scenes/title/Title.tscn")
