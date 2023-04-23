extends Node2D


func _ready():
	var HUD = $HUD
	var energyModule = $SpaceShip/EnergyModule
	var ship1Gun = $SpaceShip/Gun
	
	energyModule.connect("energy_down", HUD, "on_energy_module_down")
	energyModule.connect("recovering", HUD, "on_EnergyModule_recovering")
	ship1Gun.connect("charge_used", HUD, "on_charge_used")
	ship1Gun.connect("charges_recoverd", HUD, "on_charges_recovered")
