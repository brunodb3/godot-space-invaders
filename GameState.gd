extends Node2D

# @info: This script acts as a global state manager for other scripts

var player_speed = 2000 setget set_player_speed, get_player_speed
func set_player_speed(value: int):
	player_speed = value
func get_player_speed() -> int:
	return player_speed
