extends CharacterBody2D
@export var dung: PackedScene = preload("res://dung.tscn")
@onready var marker = $Marker2D
var SPEED = 100

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
	
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
