extends HBoxContainer

@export var spells: Array[Spell] = []

func _ready() -> void:
	for spell in spells:
		var card = load("res://Scenes/spell_card.tscn").instantiate()
		card.spell = spell
		add_child(card)
