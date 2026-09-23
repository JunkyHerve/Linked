extends Node

func cast(spell: StringName, target: Entity):
	Callable.create(self, spell).call(target)

func dagger(target: Entity):
	target.health -= 1
