extends Node
class_name EnergyModule

signal energy_depleted
signal energy_down
signal energy_recovering

export(int) var max_energy = 500
export(float) var recovery_weight = 0.009
var current_energy = 0
var recharge_enabled = false

func _ready():
	current_energy = max_energy
	
func substract_energy(amount):
	current_energy -= amount
	
func recharge():
	current_energy = lerp(current_energy, max_energy, recovery_weight)

func toggle_recharge():
	if recharge_enabled:
		recharge_enabled = false
	else:
		recharge_enabled = true
