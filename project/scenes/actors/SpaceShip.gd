extends KinematicBody2D

export(int) var max_speed = 250
export(float) var rotation_speed = 1.5
export(Vector2) var friction = Vector2(1, 0)
var acceleration = Vector2(0, -30)
var velocity = Vector2()
var rotation_dir = 0

func get_input():
	rotation_dir = 0
	if Input.is_action_pressed("ui_accept"):
		$Gun.shoot()
	if Input.is_action_pressed('ui_right'):
		rotation_dir += 1
	if Input.is_action_pressed('ui_left'):
		rotation_dir -= 1
	
func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	if Input.is_action_pressed("ui_up"):
		velocity += acceleration.rotated(rotation)
		#velocity -= transform.y * speed
	if Input.is_action_pressed("boost") and $EnergyModule.current_energy > 0:
		max_speed = lerp(max_speed, 500, 0.05)
		$EnergyModule.substract_energy(2)
		
	else:
		if max_speed > 250:
			max_speed = lerp(max_speed, 250, 0.01)
		
		if max_speed <= 260:
			$EnergyModule.recharge()
		
	
	if velocity.length() > 0:
		velocity -= friction.rotated(friction.angle_to(velocity))
	velocity = velocity.limit_length(max_speed)
	velocity = move_and_slide(velocity)


func _on_Timer_timeout():
	print("Max Speed: ", max_speed)
	print("Energy: ", $EnergyModule.current_energy)


func _on_health_depleted():
	self.queue_free()
