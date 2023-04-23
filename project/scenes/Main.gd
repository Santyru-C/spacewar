extends Node2D


func _ready():
	var HUD = $HUD
	var energyModule = $SpaceShip/EnergyModule
	
	energyModule.connect("energy_down", HUD, "on_energy_module_down")
	energyModule.connect("recovering", HUD, "on_EnergyModule_recovering")
