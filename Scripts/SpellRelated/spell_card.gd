extends Node2D
class_name SpellCard

@onready var label_title: Label = %LabelTitle
@onready var label_cost: Label = %LabelCost
@onready var background: ColorRect = $Background

@export var spell: Spell

var TYPE_COLORS = {
	OffenseSpell: Color8(255, 0, 0),
	DefenseSpell: Color8(0, 0, 255),
	StatusSpell: Color8(0, 255, 0)
}

func _ready() -> void:
	if spell == null:
		push_error("spell card", self, " doesn't have any spells")
		return
	label_title.text = spell.name
	label_cost.text = str(spell.cost)
	if spell is OffenseSpell: background.color = Color.RED
	elif spell is DefenseSpell: background.color = Color.BLUE
	elif spell is StatusSpell: background.color = Color.GREEN
