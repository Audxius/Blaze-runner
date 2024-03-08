extends TextureButton

@export var levelPath: NodePath

func _on_pressed():
	if levelPath == null:
		return
	get_tree().change_scene_to_file(levelPath)
