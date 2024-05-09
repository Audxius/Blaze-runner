extends Node2D
@onready var timer = $Timer


@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("explosion")
	timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(timer.time_left <=0):
		queue_free()


func _on_area_2d_body_entered(body):
	if(body.name=="Player"):
		body.get_node("CanvasLayer").get_node("health").take_damage(25)
