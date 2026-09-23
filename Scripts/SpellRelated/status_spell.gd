@tool
extends Spell
class_name StatusSpell

enum Type { BUFF_ADD, BUFF_MULT }
@export var type: Type
