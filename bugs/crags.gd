extends Node2D
func clip(poly):
	var offset_poly = Polygon2D.new()
	offset_poly.global_position = Vector2.ZERO
	var newvalues = []
	for point in poly.polygon:
		newvalues.append(point + poly.global_position)
	offset_poly.polygon = PackedVector2Array(newvalues)
	var res = Geometry2D.clip_polygons($Background.polygon, offset_poly.polygon)
	
	$Background.polygon = res[0]
	$StaticBody2D/CollisionPolygon2D.set_deferred("polygon", res[0])
	
