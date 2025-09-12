extends RigidBody2D
@onready var explosioncollision = $Explosion/CollisionPolygon2D

var damage = 30
func _physics_process(delta: float) -> void:
	move_local_y(-20)





func _on_area_2d_body_entered(body: Node2D) -> void:
	explosioncollision.disabled = false
	explosioncollision.disabled = true
	visible = false
	queue_free()


func _on_explosion_area_entered(area: Area2D) -> void:
	if area.has_method('hurt'):
		area.hurt(damage / (global_position - area.global_position))




func _on_explosion_body_entered(body: Node2D) -> void:
	if body.has_method('destroy'):
		body.get_parent().clip($Explosion/CollisionPolygon2D)
	queue_free()
