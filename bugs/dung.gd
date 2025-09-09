extends RigidBody2D
@onready var explosioncollision = $Explosion/CollisionShape2D
func _physics_process(delta: float) -> void:
	move_local_y(-10)


func _on_body_entered(body: Node) -> void:
	print('a')
	explosioncollision.disabled = false
	visible = false
	await get_tree().create_timer(1)
	queue_free()
