extends Node2D

func connect_ship_signals_to_HUD(ship):
	var HUD = $HUD
	var energyModule = ship.get_node("EnergyModule")
	var gun = ship.get_node("Gun")
	
	energyModule.connect("energy_down", HUD, "on_energy_module_down")
	energyModule.connect("recovering", HUD, "on_EnergyModule_recovering")
	gun.connect("charge_used", HUD, "on_charge_used")
	gun.connect("charges_recoverd", HUD, "on_charges_recovered")
	gun.connect("update_max_charges", HUD, "on_max_charges_updated")
	ship.connect("acelerating", HUD, "update_p1_speed")

func instantiate_player(player):
	var ship = load("res://scenes/actors/%s.tscn" % player)
	var player_instance = ship.instance()
	self.add_child(player_instance)
	
func _ready():
	instantiate_player("SpaceShip1")
	#var ship1 = $SpaceShip1
	#connect_ship_signals_to_HUD(ship1)
