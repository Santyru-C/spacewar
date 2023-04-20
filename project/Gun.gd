extends Node2D
export(PackedScene) var current_proyectile_scene
export(float) var fire_rate = 0.5
var can_fire = true

func shoot():
	if can_fire:
		can_fire = false
		var proyectile = current_proyectile_scene.instance()
		get_parent().get_parent().add_child(proyectile)
		proyectile.global_position = self.global_position
		proyectile.rotation = get_parent().rotation - PI/2
		proyectile.direction = Vector2.RIGHT.rotated(get_parent().rotation - PI/2)
		yield(get_tree().create_timer(fire_rate), "timeout")
		can_fire = true
