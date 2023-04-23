extends Control

func on_energy_module_down(amount):
	$EnergyBar.value -= amount

func on_EnergyModule_recovering(amount):
	$EnergyBar.value = amount

func on_charge_used():
	$ChargesBar.value -= 1

func on_charges_recovered():
	$ChargesBar.value = $ChargesBar.max_value

func on_max_charges_updated(amount):
	$ChargesBar.max_value = amount
