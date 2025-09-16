extends Node
@export var dungbeetle: PackedScene = preload("res://DungBeetle.tscn")
func _ready() -> void:
	spawnteam1()

func spawnteam1():
	if Main.map == 'crags':
		var db = dungbeetle.instantiate()
		self.add_child(db)
		db.global_position = CragsData.DungBeetlePos1
		db.visible = true
		



func spawnteam2():
	pass
