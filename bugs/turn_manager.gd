extends Node

func _ready() -> void:
	spawnteam1()

func spawnteam1():
	if Main.map == 'crags':
		var db = preload("res://DungBeetle.tscn").instantiate()
		db.global_position = CragsData.DungBeetlePos1
		

func spawnteam2():
	pass
