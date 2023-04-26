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

func update_p1_speed(current_speed):
	$SpeedLabel.text = str(current_speed)

func set_p2_display():
	var attributeDisplay_scene = load("res://scenes/InvertedAttributeDisplay.tscn")
	var attributeDisplay = attributeDisplay_scene.instance()
	$PlayerController2.add_child(attributeDisplay)
	$PlayerController2/Label.queue_free()
	attributeDisplay.rect_position.x -= attributeDisplay.rect_size.x + 20
	
func set_p1_display():
	var attributeDisplay_scene = load("res://scenes/AttributeDisplay.tscn")
	var attributeDisplay = attributeDisplay_scene.instance()
	$PlayerController1/Label.queue_free()
	$PlayerController1.add_child(attributeDisplay)	
	
func _ready():
	set_p1_display()
	set_p2_display()
	
