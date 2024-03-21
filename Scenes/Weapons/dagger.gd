extends Node2D

var kulka = preload("res://Scenes/laser.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())

	if Input.is_action_pressed("mouse_left"):
		pass



