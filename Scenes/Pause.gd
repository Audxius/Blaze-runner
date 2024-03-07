extends Node

var button_pressed = false
var pause_ui = preload("res://Scenes/pause_ui.tscn")
var ui = pause_ui.instantiate()

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	ui.hide()
	get_tree().root.add_child.call_deferred(ui);

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if not button_pressed:
			if not treeContainsMenu():
				ui.show()
				get_tree().paused = true
				button_pressed = true
		else:
			ui.hide()
			get_tree().paused = false
			button_pressed = false

func treeContainsMenu():
	var menuNames = ["Title screen","LevelSelectScene"]
	var exists = false
	
	for menuName in menuNames:
		if get_tree().root.has_node(menuName):
			exists = true
		
	return exists
