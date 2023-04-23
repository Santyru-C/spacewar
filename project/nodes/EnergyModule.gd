extends Node
class_name EnergyModule

signal depleted
signal energy_down(amount)
signal recovering(amount)

export(int) var max_energy = 500
export(float) var r_weight1 = 0.009
export(float) var r_weight2 = 0.018

var current_energy = 0
var recharge_enabled = false

func _ready():
	current_energy = max_energy
	
func substract_energy(amount):
	current_energy -= amount
	emit_signal("energy_down",amount)
	
func recharge():
	if current_energy < max_energy/2:
		current_energy = lerp(current_energy, max_energy, r_weight1)
	else:
		current_energy = lerp(current_energy, max_energy, r_weight2)
	emit_signal("recovering", current_energy)

func toggle_recharge():
	if recharge_enabled:
		recharge_enabled = false
	else:
		recharge_enabled = true
