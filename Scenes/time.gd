extends Label
var minutes
var seconds

# Called when the node enters the scene tree for the first time.
func _ready():
	minutes = 0
	seconds = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	seconds = seconds + delta
	if(seconds >= 60):
		minutes = minutes + 1
		seconds = seconds - 60
	if(seconds<10):
		text=str(minutes)+":0"+str(int(seconds))
	else:
		text=str(minutes)+":"+str(int(seconds))
