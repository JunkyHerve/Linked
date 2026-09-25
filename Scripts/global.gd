extends Node

var player: Player
var pulled_spells: Array[Spell] = []

func _ready() -> void:
	player = Player.new()
	player.health = 30
	player.mana = 30

func get_spells(path: String = "res://Ressources/spells/") -> Array[Spell]:
	var spells: Array[Spell] = []
	var dir = DirAccess.open(path)
	dir.list_dir_begin()
	var file_name = dir.get_next()
	while file_name != "":
		var spell_path = path + "/" + file_name
		if dir.current_is_dir():
			spells += get_spells(spell_path)
		else:
			var spell = ResourceLoader.load(spell_path)
			if spell is Spell:
				spells.append(spell)
		file_name = dir.get_next()
	return spells

func pull_spell() -> Spell:
	var spells: Array[Spell] = get_spells()
	if spells.size() == 0: return
	for spell in spells:
		if spell in pulled_spells:
			spells.erase(spell)
	var spell = spells.pop_at(randi_range(0, spells.size()-1))
	pulled_spells.append(spell)
	return spell
