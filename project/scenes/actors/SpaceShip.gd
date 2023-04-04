extends KinematicBody2D

var speed = 40
var acceleration = Vector2(30, 0)
# make the character accelerate faster when starting from 0

var velocity = Vector2()
var rotation_dir = 0
var rotation_speed = 1

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
		velocity = Vector2(0, -speed)
	#velocity += acceleration * delta
	#print(velocity)
	velocity = move_and_slide(velocity)


func _on_Timer_timeout():
	print(position)
