extends Node
class_name EnergyModule

export(int) var max_energy = 500
export(float) var recovery_weight = 0.009
var current_energy = 0
var recharge_enabled = true

func substract_energy(amount):
	max_energy -= amount
	
func recharge():
	current_energy = lerp(current_energy, max_energy, recovery_weight)
