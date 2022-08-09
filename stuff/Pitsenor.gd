extends Area2D





func _on_Pitsenor_body_entered(body: KinematicBody2D) -> void:
	get_tree().reload_current_scene()
