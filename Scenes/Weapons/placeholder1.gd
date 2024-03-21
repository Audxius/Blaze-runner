extends Node2D

var kulka = preload("res://Scenes/laser.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())

	if Input.is_action_pressed("mouse_left"):
		bullet()

func bullet():
	var instance = kulka.instantiate()
	instance.position.x = get_parent().position.x
	instance.position.y = get_parent().position.y
	get_parent().add_sibling(instance)

