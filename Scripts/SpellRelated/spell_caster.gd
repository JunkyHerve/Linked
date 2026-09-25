extends Node

func cast(spell: StringName, caster: Entity, target: Entity):
	Callable.create(self, spell).call(caster, target)

# OffenseSpells
func dagger(caster: Entity, target: Entity):
	caster.attack(target, 1)

func wooden_sword(caster: Entity, target: Entity):
	caster.attack(target, 4)

func adrenaline_sword(caster: Entity, target: Entity):
	caster.attack(target, 5 if caster.health > caster.max_health/2 else 10)

func discharge(caster: Entity, target: Entity):
	caster.attack(target, 3)
	target.add_status(StatusLoader.ShockStatus, 1)


# DefenseSpells
func buckler(caster: Entity, _target: Entity):
	caster.add_shield(1)

func electric_shield(caster: Entity, _target: Entity):
	caster.add_shield(15)
	caster.add_status(StatusLoader.ShockStatus, 3)

func barbwire(caster: Entity, _target: Entity):
	caster.add_status(StatusLoader.SpikeStatus, 10)	



# SupportSpells
func dodge(caster: Entity, _target: Entity):
	caster.add_dodge(1)
	
func illusion(caster: Entity, _target: Entity):
	if randi_range(0, 1) == 1:
		caster.add_dodge(2)

func poison(_caster: Entity, target: Entity):
	target.add_status(StatusLoader.PoisonStatus, 2)


# Status
func status_effect(status: StringName, target: Entity):
	Callable.create(self, "status_"+status).call(target)

func status_poison(target: Entity):
	target.take_damage(target.get_status_level(StatusLoader.PoisonStatus))

func status_shock(target: Entity):
	target.shock -= target.get_status_level(StatusLoader.ShockStatus)
