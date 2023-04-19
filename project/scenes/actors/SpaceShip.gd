extends KinematicBody2D

var max_speed = 250
var acceleration = Vector2(0, -30)
# make the character accelerate faster when starting from 0

var velocity = Vector2()
var rotation_dir = 0
var rotation_speed = 1.5
var friction = Vector2(1, 0)
var energy = 1000
	#velocity = transform.y * acceleration
func get_input():
	rotation_dir = 0
	if Input.is_action_pressed('ui_right'):
		rotation_dir += 1
	if Input.is_action_pressed('ui_left'):
		rotation_dir -= 1

func _process(_delta):
	$LifeDisplay.update_display($HealthModule.current_health)
	
func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	if Input.is_action_pressed("ui_up"):
		velocity += acceleration.rotated(rotation)
		#velocity -= transform.y * speed
	if Input.is_action_pressed("boost") and energy > 0:
		max_speed = lerp(max_speed, 500, 0.05)
		energy -= 2
		
	else:
		if max_speed > 250:
			max_speed = lerp(max_speed, 250, 0.01)
		
	
		#add timer check
		if max_speed <= 260:
			energy = lerp(energy, 1000, 0.009)
		
	
	if velocity.length() > 0:
		velocity -= friction.rotated(friction.angle_to(velocity))
	velocity = velocity.limit_length(max_speed)
	#velocity += acceleration * delta
	#print(velocity)
	velocity = move_and_slide(velocity)


func _on_Timer_timeout():
	print("Max Speed: ", max_speed)
	print("Energy: ", energy)


func _on_EnergyTimer_timeout():
	pass


func _on_health_depleted():
	self.queue_free()
