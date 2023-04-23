extends Node2D

# add function to connect all player 1 and 2 signals
func _ready():
	var HUD = $HUD
	var energyModule = $SpaceShip/EnergyModule
	var ship1Gun = $SpaceShip/Gun
	
	energyModule.connect("energy_down", HUD, "on_energy_module_down")
	energyModule.connect("recovering", HUD, "on_EnergyModule_recovering")
	ship1Gun.connect("charge_used", HUD, "on_charge_used")
	ship1Gun.connect("charges_recoverd", HUD, "on_charges_recovered")
	ship1Gun.connect("update_max_charges", HUD, "on_max_charges_updated")
