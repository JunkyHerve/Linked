extends Resource
class_name Entity

@export var max_health: int
@export var health: int
@export var mana: int
@export var shield: int
@export var dodge: int

@export var spells: Array[Spell]
@export var statuses: Dictionary[Status, int]

func take_damage(dmg: int):
	shield -= dmg
	if shield < 0:
		health -= abs(shield)
		shield = 0

func add_shield(value: int):
	shield += value

func add_dodge(value: int):
	dodge += value

func add_status(status: Status, level: int = 1):
	if not status in statuses.keys():
		statuses[status] = level
	else:
		statuses[status] += level

func has_status(status: Status) -> bool:
	return status in statuses

func get_status_level(status: Status) -> int:
	return statuses[status] if status in statuses.keys() else 0

func attack(target: Entity, dmg: int):
	if target.dodge > 0:
		target.dodge -= 1
		return
	if target.has_status(StatusLoader.SpikeStatus):
		health -= target.get_status_level(StatusLoader.SpikeStatus)
	target.take_damage(dmg)

func process_status():
	for status in statuses:
		if statuses[status] > 0 and not status.function.is_empty():
			SpellCaster.status_effect(status.function, self)
		elif statuses[status] > 0:
			statuses[status] -= 1
