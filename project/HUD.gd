extends Control


func _ready():
	pass

func on_energy_module_down(amount):
	$EnergyBar.value -= amount

func on_EnergyModule_recovering(amount):
	$EnergyBar.value = amount

func on_charge_used():
	$ChargesBar.value -= 1

func on_charges_recovered():
	$ChargesBar.value = $ChargesBar.max_value
