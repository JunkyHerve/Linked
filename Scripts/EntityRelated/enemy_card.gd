extends Node2D

@onready var label_name: Label = %LabelName
@onready var label_health: Label = %LabelHealth
@onready var label_mana: Label = %LabelMana
@onready var label_shield: Label = %LabelShield
@onready var sprite: Sprite2D = %Sprite

@export var enemy: Enemy

func _ready() -> void:
	if enemy == null:
		push_error("enemy card ", self, " doesn't have any enemy")
		return
	label_name.text = enemy.name
	label_health.text = "health: " + str(enemy.health)
	label_mana.text = "mana: " + str(enemy.mana)
	label_shield.text = "shield: " + str(enemy.shield)
	sprite.texture = enemy.sprite
