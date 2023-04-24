extends KinematicBody2D
signal acelerating(current_speed)

export(int) var max_speed = 250
export(float) var rotation_speed = 1.5
export(Vector2) var friction = Vector2(0.5, 0)
export(String) var move_up_action
export(String) var move_down_action
export(String) var move_left_action
export(String) var move_right_action
export(String) var shoot_action
export(String) var boost_action

var acceleration = Vector2(0, -30)
var velocity = Vector2()
var rotation_dir = 0

func get_input():
	rotation_dir = 0
	if Input.is_action_pressed(shoot_action):
		$Gun.shoot()
	if Input.is_action_pressed(move_right_action):
		rotation_dir += 1
	if Input.is_action_pressed(move_left_action):
		rotation_dir -= 1
	
func _physics_process(delta):
	var tmp_pos = Vector2()
	get_input()
	emit_signal("acelerating", floor(velocity.length()))
	rotation += rotation_dir * rotation_speed * delta
	if Input.is_action_pressed(move_up_action):
		velocity += acceleration.rotated(rotation)
		#velocity -= transform.y * speed
	if Input.is_action_pressed(boost_action) and $EnergyModule.current_energy > 0:
		max_speed = lerp(max_speed, 500, 0.05)
		$EnergyModule.substract_energy(2)
		
	else:
		if max_speed > 250:
			max_speed = lerp(max_speed, 250, 0.01)
		
		if max_speed <= 260:
			$EnergyModule.recharge()
		
	if velocity.length() > 1:
		velocity -= friction.rotated(friction.angle_to(velocity))
		
	velocity = velocity.limit_length(max_speed)
	velocity = move_and_slide(velocity)

func _on_health_depleted():
	self.queue_free()

func _on_HitBox_area_entered(area):
	area.take_damage(velocity.length())
