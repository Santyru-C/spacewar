extends Area2D

export(int) var speed

var direction = Vector2()
	
func _physics_process(delta):
	position += direction * speed * delta

