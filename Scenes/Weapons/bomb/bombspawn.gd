extends Node2D
@onready var timer = $Timer
const BOMB = preload("res://Scenes/Weapons/bomb/bomb.tscn")

# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(timer.time_left <=0):
		print("end")
		
		var spawn = BOMB.instantiate()
		spawn.position.x = position.x
		spawn.position.y = position.y - 1000
		get_parent().add_child(spawn)
		queue_free()
