extends Node

func cast(spell: StringName, caster: Entity, target: Entity):
	Callable.create(self, spell).call(caster, target)

func dagger(caster: Entity, target: Entity):
	caster.attack(target, 1)


func status_effect(status: StringName, target: Entity):
	Callable.create(self, "status_"+status).call(target)

func status_poison(target: Entity):
	target.take_damage(target.get_status_level(StatusLoader.PoisonStatus))

func status_shock(target: Entity):
	target.shock -= 1
