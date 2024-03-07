extends ColorRect

var hp = 1000;

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(hp)
	scale.x = hp*0.01
	if Input.is_key_pressed(KEY_G):
		damage(10)
			
func damage(amount):
	if hp>=0:
		hp-=amount
