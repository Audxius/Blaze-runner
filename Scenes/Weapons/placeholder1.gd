extends Node2D

var kulka = preload("res://Scenes/laser.tscn")
var kulka2 = preload("res://Scenes/Enemies/enemylaser.tscn")
var player
var shooting = 1
var canShoot = true
var timer

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_parent().get_node("Player")
	timer = $ShootTimer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().name == "Player":
		if Input.is_action_pressed("mouse_left") and canShoot:
			bullet()
			canShoot = false
			timer.start()
		look_at(get_global_mouse_position())
		
	else:
		look_at(player.position)
		if shooting == 0 and canShoot:
			bullet()
			canShoot = false
			timer.start()
	
	

func bullet():
	if get_parent().name=="Player":
		var instance = kulka.instantiate()
		instance.position.x = get_parent().position.x
		instance.position.y = get_parent().position.y
		get_parent().add_sibling(instance)
	else:
		var instance = kulka2.instantiate()
		instance.position.x = get_parent().position.x
		instance.position.y = get_parent().position.y
		get_parent().add_sibling(instance)



func _on_notice_area_body_entered(body):
	if body.name == "Player":
		shooting = 0


func _on_notice_area_body_exited(body):
	if body.name == "Player":
		shooting = 1
	


func _on_shoot_timer_timeout():
	canShoot = true
