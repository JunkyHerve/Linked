extends Node2D

@onready var spell_card: SpellCard = $SpellCard


func _on_button_pressed() -> void:
	SpellCaster.cast(spell_card.spell.function, Global.player)
