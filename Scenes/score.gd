extends Label

var score = 0
# Called when the node enters the scene tree for the first time.

func _process(delta):
	#if Input.is_key_pressed(KEY_P):
		#add_score(1)
	text = str(score)

func add_score(amount):
	score += amount
	Global.score += amount

