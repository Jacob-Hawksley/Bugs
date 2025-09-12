extends CharacterBody2D
@export var dung: PackedScene = preload("res://dung.tscn")
@onready var marker = $Marker2D


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()
	marker.rotate(marker.get_angle_to(get_global_mouse_position()))
	marker.rotate(PI/2)

func shoot():
	$AnimatedSprite2D.play("default")
	await get_tree().create_timer(1).timeout
	var d = dung.instantiate()
	owner.add_child(d)
	d.transform = marker.global_transform
	
