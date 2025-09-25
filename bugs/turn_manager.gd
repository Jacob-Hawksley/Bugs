extends Node
var remainingbugs = ['db']
var bugs = ['db']
@export var dungbeetle: PackedScene = preload("res://DungBeetle.tscn")
func _ready() -> void:
	spawnteam1()
	spawnteam2()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("endturn"):
		nextturn()
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

		
		
		
func nextturn():
	print('a')
	if remainingbugs != []:
		Main.turn = remainingbugs[0]
		remainingbugs.pop_front()
	elif Main.team == 1:
		Main.team = 2 
	elif Main.team == 2:
		Main.team = 1
