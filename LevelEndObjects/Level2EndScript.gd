extends Node

var scoreScene

func _ready():
	scoreScene = preload("res://Scenes/ScoreScreen/ScoreScene.tscn")
	

func _on_area_2d_body_entered(body):
	if(body.name == "Player"):
		Global.save_level2_score()
		get_tree().call_deferred("change_scene_to_packed", scoreScene)
		
