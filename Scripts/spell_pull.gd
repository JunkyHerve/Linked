extends HBoxContainer

@export var number_spells: int = 3
@export var spells: Array[Spell] = []

var cards: Array[SpellCard] = []

func _ready() -> void:
	setup()

func setup() -> void:
	for node in cards:
		node.queue_free()
	cards.clear()
	spells.clear()
	
	for i in range(number_spells):
		spells.append(Global.pull_spell())
	
	for spell in spells:
		var card = load("res://Scenes/spell_card.tscn").instantiate()
		card.spell = spell
		add_child(card)
		cards.append(card)


func _on_button_pressed() -> void:
	setup()
