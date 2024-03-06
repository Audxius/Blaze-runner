extends Node

var button_pressed = false

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(delta):
	if Input.is_action_just_pressed("pause"):
		if not button_pressed:
			get_tree().paused = true
			button_pressed = true
		else:
			get_tree().paused = false
			button_pressed = false
