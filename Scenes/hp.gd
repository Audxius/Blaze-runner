extends ColorRect

var hp = 100;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(hp)
	scale.x = hp*0.01
	if Input.is_key_pressed(KEY_G):
		if hp>=0:
			hp-=1
	if hp <=0:
		get_tree().reload_current_scene()
