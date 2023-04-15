extends Node
class_name HealthModule
signal health_depleted
signal health_down
signal health_up

export(int) var max_health
var current_health

func _ready():
	current_health = max_health
	print("ready")
	
func substract_from_health(amount):
	current_health -= amount
	print(amount)
	emit_signal("health_down")
	
func _process(delta):
	pass
