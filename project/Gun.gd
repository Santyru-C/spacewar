extends Node2D
export(PackedScene) var current_proyectile_scene

func _unhandled_input(event):
	if Input.is_action_pressed("ui_accept"):
		var proyectile = current_proyectile_scene.instance()
		get_parent().get_parent().add_child(proyectile)
		proyectile.global_position = self.global_position
		proyectile.rotation = get_parent().rotation - PI/2
		proyectile.direction = Vector2.RIGHT.rotated(get_parent().rotation - PI/2)
