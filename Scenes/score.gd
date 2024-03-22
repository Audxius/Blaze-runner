extends Label

var score = 0
# Called when the node enters the scene tree for the first time.

func _process(delta):
	text = str(score)

func add_score(amount):
	score += amount
