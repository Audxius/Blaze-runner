extends Node2D

var kulka = preload("res://Scenes/laser.tscn")
var kulka2 = preload("res://Scenes/Enemies/enemylaser.tscn")
var player
var shooting = 1
var canShoot = true
var timer
var maxAmmo = 35
var ammo = maxAmmo

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_parent().get_node("Player")
	timer = $ShootTimer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().name == "Player":
		var ammoLabel = get_parent().get_node("CanvasLayer/AmmoLabel")
		if Input.is_action_pressed("mouse_left") and canShoot and ammo > 0:
			fire(ammoLabel)
		if Input.is_action_pressed("reload"):
			reload(ammoLabel)
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

func fire(label):
	bullet()
	ammo -= 1
	canShoot = false
	timer.start()
	label.text = str(ammo,"/",maxAmmo)
	
func reload(label):
	ammo = maxAmmo
	label.text = str(ammo,"/",maxAmmo)

func _on_notice_area_body_entered(body):
	if body.name == "Player":
		shooting = 0


func _on_notice_area_body_exited(body):
	if body.name == "Player":
		shooting = 1
	


func _on_shoot_timer_timeout():
	canShoot = true
