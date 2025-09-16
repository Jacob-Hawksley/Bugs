extends CharacterBody2D
@export var dung: PackedScene = preload("res://dung.tscn")
@onready var marker = $Marker2D
var SPEED = 100
var teamnum
var remainingspeed = 5
var shot = false

func _process(delta: float) -> void:

	marker.rotate(marker.get_angle_to(get_global_mouse_position()))
	marker.rotate(PI/2)
	if Main.team == teamnum and Main.turn == 'db':
		var direction := Input.get_axis("left", "right")
		if remainingspeed > 0:
			
			if direction:
				velocity.x = direction * SPEED
				remainingspeed -= delta
				
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
				
		if Input.is_action_just_pressed("shoot") and not shot:
			shoot()
			shot = true

func shoot():
	$AnimatedSprite2D.play("default")
	await get_tree().create_timer(1).timeout
	var d = dung.instantiate()
	get_node("/root/Main").add_child(d)
	d.transform = marker.global_transform
	
func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta


	move_and_slide()
func team(number):
	teamnum = number
