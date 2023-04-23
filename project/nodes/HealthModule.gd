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

func check_life_depleted():
	if current_health <= 0:
		emit_signal("health_depleted")
		
func substract_from_health(amount):
	current_health -= amount
	emit_signal("health_down")
	check_life_depleted()
