extends Sprite2D

func _ready():
	get_parent().get_node("Player").get_node("Camera2D").limit_right = position.x + 60
