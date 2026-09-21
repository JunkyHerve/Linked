@tool
extends Spell
class_name OffenseSpell

enum Type { PHYSICAL, POISON, SHOCK, TETANUS, BRUN }
@export var type: Type
