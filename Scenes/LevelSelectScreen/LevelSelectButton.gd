extends TextureButton

@export var levelPath: NodePath
@export var gunSelectScene: PackedScene

func _on_pressed():
	if gunSelectScene == null:
		return
	#var gunSelectSceneRootNode = gunSelectScene.instantiate()
	#var StartLevelButton = gunSelectSceneRootNode.get_node("StartLevelButton")
	#StartLevelButton.set("scene",gunSelectScene)
	Global.goToLevel = levelPath
	get_tree().change_scene_to_packed(gunSelectScene)
