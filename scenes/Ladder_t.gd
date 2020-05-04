extends Area2D


func _on_Ladder_t_body_entered(body):
	if "Player" in body.name:
		body.is_climping = true


func _on_Ladder_t_body_exited(body):
	if "Player" in body.name:
		body.is_climping = false


func _on_Ladder2_body_exited(body):
	pass # Replace with function body.
