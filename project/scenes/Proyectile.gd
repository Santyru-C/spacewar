extends Area2D

export(int) var speed
export(int) var damage_amount = 35
var direction = Vector2()

func _physics_process(delta):
	position += direction * speed * delta

func _on_Proyectile_area_entered(area):
	area.take_damage(damage_amount)
	queue_free()
