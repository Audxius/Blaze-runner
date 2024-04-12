extends Node2D


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		body.get_node("CanvasLayer").get_node("score").add_score(150)
		queue_free()
