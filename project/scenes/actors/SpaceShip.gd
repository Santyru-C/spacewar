extends KinematicBody2D

var speed = 10
var acceleration = Vector2(30, 0)
# make the character accelerate faster when starting from 0

var velocity = Vector2()
var rotation_dir = 0
var rotation_speed = 1
var friction = Vector2(1, 0)

	#velocity = transform.y * acceleration
func get_input():
	rotation_dir = 0
	if Input.is_action_pressed('ui_right'):
		rotation_dir += 1
	if Input.is_action_pressed('ui_left'):
		rotation_dir -= 1
		
func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	if Input.is_action_pressed("ui_up"):
		velocity -= transform.y * speed
	
	if velocity.length() > 0:
		velocity -= friction.rotated(friction.angle_to(velocity))
	velocity = velocity.limit_length(300)
	#velocity += acceleration * delta
	#print(velocity)
	velocity = move_and_slide(velocity)


func _on_Timer_timeout():
	print("friction", friction.angle_to(velocity))
