extends Control


func _ready():
	pass

func on_energy_module_down(amount):
	$ProgressBar.value -= amount

func on_EnergyModule_recovering(amount):
	$ProgressBar.value = amount
