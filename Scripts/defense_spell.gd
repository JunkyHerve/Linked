@tool
extends Spell
class_name DefenseSpell

enum Type { SHIELD, HEAL, REGEN, SPIKE, DODGE, CLEANSE }
@export var type: Type
