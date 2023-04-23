extends Node2D
export(PackedScene) var current_proyectile_scene
export(float) var fire_rate = 0.5
export(int) var max_charges = 3
var current_charges = 0
var can_fire = true

signal update_max_charges(amount)
signal charge_used
signal charges_recoverd

func instance_proyectile():
	var proyectile = current_proyectile_scene.instance()
	get_parent().get_parent().add_child(proyectile)
	proyectile.global_position = self.global_position
	proyectile.rotation = get_parent().rotation - PI/2
	proyectile.direction = Vector2.RIGHT.rotated(get_parent().rotation - PI/2)
	
func set_fire_cooldown():
	can_fire = false
	yield(get_tree().create_timer(fire_rate), "timeout")
	can_fire = true
	
func shoot():
	if can_fire and current_charges > 0:
		current_charges -= 1
		emit_signal("charge_used")
		set_fire_cooldown()
		instance_proyectile()
	
	if current_charges == 0 and !$RechargeTimer.time_left > 0:
		$RechargeTimer.start()


func _on_RechargeTimer_timeout():
	current_charges = max_charges
	emit_signal("charges_recoverd")

func _ready():
	current_charges = max_charges
	emit_signal("update_max_charges", max_charges)
