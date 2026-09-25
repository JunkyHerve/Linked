extends Control
class_name SpellCard

@onready var label_title: Label = %LabelTitle
@onready var label_cost: Label = %LabelCost
@onready var background: ColorRect = $Background

@export var spell: Spell

var TYPE_COLORS = {
	OffenseSpell: Color8(255, 0, 0),
	DefenseSpell: Color8(0, 0, 255),
	SupportSpell: Color8(0, 255, 0)
}

func _ready() -> void:
	if spell == null:
		push_error("spell card", self, " doesn't have any spells")
		return
	label_title.text = spell.name
	label_cost.text = str(spell.cost)
	if spell is OffenseSpell: background.color = Color.RED
	elif spell is DefenseSpell: background.color = Color.BLUE
	elif spell is SupportSpell: background.color = Color.GREEN


func _on_mouse_entered() -> void:
	z_index = 1
	var tween = create_tween()
	tween.tween_property(self, "offset_transform_scale", Vector2(1.3, 1.3), 0.1)
	tween.parallel()
	tween.tween_property(self, "offset_transform_rotation", randf_range(-0.5, 0.5), 0.1)

func _on_mouse_exited() -> void:
	z_index = 0
	var tween = create_tween()
	tween.tween_property(self, "offset_transform_scale", Vector2(1, 1), 0.1)
	tween.parallel()
	tween.tween_property(self, "offset_transform_rotation", .0, 0.1)
