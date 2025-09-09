extends CharacterBody2D
@export var dung: PackedScene = preload("res://dung.tscn")
@onready var marker = $Marker2D


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()
	marker.rotate(marker.get_angle_to(get_local_mouse_position()))
	marker.rotation += PI / 2

func shoot():
	var d = dung.instantiate()
	owner.add_child(d)
	d.transform = marker.global_transform
	
