extends Node2D

var simultaneous_scene = preload("res://Scenes/LevelSelectScreen/LevelSelectScene.tscn").instantiate()

func _process(delta):
	if Input.is_action_just_pressed("enter"):
		get_tree().root.add_child(simultaneous_scene)
		get_node("/root/Title screen").free()
