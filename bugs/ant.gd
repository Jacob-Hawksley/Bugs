extends CharacterBody2D
@export var rocket: PackedScene = preload("res://rocket.tscn")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var r = rocket.instantiate()
	owner.add_child(r)
	r.global_transform = $Marker2D.global_transform
