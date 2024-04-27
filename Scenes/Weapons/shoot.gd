extends Node2D
var player
var timer
var shooting = 1
var canShoot = true
var kulka2 = preload("res://Scenes/Enemies/enemylaser.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_parent().get_node("Player")
	timer = $"../Timer"
	



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(player.position)
	if shooting == 0 and canShoot:
		bullet()
		canShoot = false
		timer.start()
func bullet():
	var instance = kulka2.instantiate()
	instance.position.x = get_parent().position.x
	instance.position.y = get_parent().position.y
	get_parent().add_sibling(instance)


func _on_notice_area_body_entered(body):
	if body.name == "Player":
		shooting = 0
		



func _on_timer_timeout():
	canShoot = true



func _on_notice_area_body_exited(body):
	if body.name == "Player":
		shooting = 1
