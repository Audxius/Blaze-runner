extends Sprite2D

var timer = 0.5
var startLocation

# Called when the node enters the scene tree for the first time.
func _ready():
	startLocation = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer >= 0:
		timer -= delta
		position = Vector2(10000, 10000)
	elif timer >= -0.5:
		timer -= delta
		position = startLocation
	else:
		timer = 0.5
