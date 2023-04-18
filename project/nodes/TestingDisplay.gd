extends Label
class_name TestingDisplay

func update_text_content(string):
	self.text = string
	
func format_properties(properties):
	assert(properties is Array, "Error: All testing values should be passed as an array")
	# properties should be passed as an array to 
	var formated_properties = ""
	for property in properties:
		formated_properties += property
		
	return formated_properties

func _ready():
	update_text_content("ready")
	print(format_properties(["juan", "carlos"]))
	
