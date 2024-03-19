extends Node

func _on_pressed():
	if Global.goToLevel == null:
		return
	get_tree().change_scene_to_file(Global.goToLevel)
