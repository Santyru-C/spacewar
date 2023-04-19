extends Label
class_name PropertyDisplay

export(String) var property_name

func update_display(value):
	self.text = "%s: %s" % [property_name, value]
	
	
