extends Node

var player: Entity

func _ready() -> void:
	player = Entity.new()
	player.health = 30
	player.mana = 30

func _process(delta: float) -> void:
	pass
