extends Node
class_name EnergyModule

signal depleted
signal energy_down(amount)
signal recovering(amount)

export(int) var max_energy = 500
export(float) var recovery_weight = 0.009
var current_energy = 0
var recharge_enabled = false

func _ready():
	current_energy = max_energy
	
func substract_energy(amount):
	current_energy -= amount
	emit_signal("energy_down",amount)
	
func recharge():
	current_energy = lerp(current_energy, max_energy, recovery_weight)
	emit_signal("recovering", current_energy)

func toggle_recharge():
	if recharge_enabled:
		recharge_enabled = false
	else:
		recharge_enabled = true
