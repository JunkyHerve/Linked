extends Node2D

func _ready() -> void:
	print("health: ", Global.player.health)
	print("statuses: ", Global.player.statuses)

	print("\npoisoning player")
	Global.player.add_status(StatusLoader.PoisonStatus)
	print("health: ", Global.player.health)
	print("statuses: ", Global.player.statuses)
	
	print("\nagain")
	Global.player.add_status(StatusLoader.PoisonStatus)
	print("health: ", Global.player.health)
	print("statuses: ", Global.player.statuses)
	
	print("\nprocesssing status")
	Global.player.process_status()
	print("health: ", Global.player.health)
	print("statuses: ", Global.player.statuses)
	
	print("\n\n Oh no! a cool enemy appears!")
	var enemy = Enemy.new()
	enemy.name = "Cool enemy"
	enemy.health = 10
	print("health: ", Global.player.health)
	print("statuses: ", Global.player.statuses)
	print("enemy health: ", enemy.health)
	print("enemy statuses: ", enemy.statuses)
	
	print("\nenemy get spikes")
	enemy.add_status(StatusLoader.SpikeStatus)
	print("health: ", Global.player.health)
	print("statuses: ", Global.player.statuses)
	print("enemy health: ", enemy.health)
	print("enemy statuses: ", enemy.statuses)
	
	print("\nagain")
	enemy.add_status(StatusLoader.SpikeStatus)
	print("health: ", Global.player.health)
	print("statuses: ", Global.player.statuses)
	print("enemy health: ", enemy.health)
	print("enemy statuses: ", enemy.statuses)
	
	print("\nplayer attack enemy! (3dmg)")
	Global.player.attack(enemy, 3)
	print("health: ", Global.player.health)
	print("statuses: ", Global.player.statuses)
	print("enemy health: ", enemy.health)
	print("enemy statuses: ", enemy.statuses)
	
	pass
	
