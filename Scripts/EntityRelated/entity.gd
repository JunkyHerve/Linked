extends Resource
class_name Entity

@export var health: int
@export var mana: int
@export var shield: int

@export var spells: Array[Spell]
@export var statuses: Dictionary[Status, int]

func take_damage(dmg: int):
	health -= dmg

func add_status(status: Status):
	if not status in statuses.keys():
		statuses[status] = 1
	else:
		statuses[status] += 1

func has_status(status: Status) -> bool:
	return status in statuses

func get_status_level(status: Status) -> int:
	return statuses[status] if status in statuses.keys() else 0

func attack(target: Entity, dmg: int):
	if target.has_status(StatusLoader.SpikeStatus):
		health -= target.get_status_level(StatusLoader.SpikeStatus)
	target.take_damage(dmg)

func process_status():
	for status in statuses:
		if not status.function.is_empty():
			SpellCaster.status_effect(status.function, self)
