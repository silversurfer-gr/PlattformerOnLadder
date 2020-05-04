extends Area2D


func _on_Ladder_b_body_entered(body):
	if "Player" in body.name:
		body.is_climping = true


func _on_Ladder_b_body_exited(body):
	if "Player" in body.name:
		body.is_climping = false
