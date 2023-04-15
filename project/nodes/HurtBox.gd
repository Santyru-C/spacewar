extends Area2D
class_name HurtBox

export(NodePath) var health_module_path
var HealthModule

func _ready():
	HealthModule = get_node(health_module_path)

func take_damage(amount):
	HealthModule.substract_from_health(amount)
	
# can acceptbulletcollision?
