extends Node

var player: Player

func _ready() -> void:
	player = Player.new()
	player.health = 30
	player.mana = 30
