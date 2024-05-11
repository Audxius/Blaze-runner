extends Node2D


func _on_area_2d_body_entered(body):
	if body.name == "Player":
		body.get_node("CanvasLayer").get_node("score").add_score(150)
		var hp = body.get_node("CanvasLayer").get_node("health").hp
		body.get_node("CanvasLayer").get_node("health").heal(100-hp)
		queue_free()
