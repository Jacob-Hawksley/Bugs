extends Node
@export var dungbeetle: PackedScene = preload("res://DungBeetle.tscn")
func _ready() -> void:
	spawnteam1()
	spawnteam2()


func spawnteam1():
	if Main.map == 'crags':
		var db = dungbeetle.instantiate()
		add_child(db)
		db.global_position = CragsData.DungBeetlePos1
		db.visible = true
		db.team(1)
		



func spawnteam2():
	if Main.map == 'crags':
		var db = dungbeetle.instantiate()
		add_child(db)
		db.global_position = CragsData.DungBeetlePos2
		db.visible = true
		db.team(2)
