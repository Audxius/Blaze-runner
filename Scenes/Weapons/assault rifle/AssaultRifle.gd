extends Node2D

var kulka = preload("res://Scenes/Weapons/assault rifle/RifleBullet.tscn")
var kulka2 = preload("res://Scenes/Enemies/enemylaser.tscn")
var player
var shooting = 1
var canShoot = true
var timer
var maxAmmo = 30
#var ammo = maxAmmo
var shootingSound

var sprite
var mpos = Vector2()
var pos = Vector2()
var rot  
var flipped = false
var spriteOriginalPos
var barrelEndOriginalPos
var handOriginalPos


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_parent().get_node("Player")
	timer = $ShootTimer
	shootingSound = get_node("ShootingSound")
	sprite = get_node("Sprite2D")
	spriteOriginalPos = sprite.position
	barrelEndOriginalPos = $Sprite2D/BarrelEnd.position
	handOriginalPos = $Sprite2D/Sprite2D2.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().name == "Player":
		var ammoLabel = get_parent().get_node("CanvasLayer/AmmoLabel")
		if Input.is_action_pressed("mouse_left") and canShoot and Global.currentRifleAmmo > 0:
			fire(ammoLabel)
		if Input.is_action_just_pressed("reload") and Global.currentRifleAmmo < maxAmmo and Global.totalRifleAmmo/maxAmmo != 0:
			reload(ammoLabel)
		look_at(get_global_mouse_position())
		
		mpos = get_global_mouse_position()
		pos = global_position
		rot = rad_to_deg((mpos - pos).angle())
		if(rot >= -90 and rot <= 90):
			sprite.flip_v = false
			if not flipped:
				flipped = true
				sprite.position = spriteOriginalPos
				$Sprite2D/BarrelEnd.position = barrelEndOriginalPos
				$Sprite2D/Sprite2D2.position = handOriginalPos
				$Sprite2D/Sprite2D2.flip_v = false
		else:
			sprite.flip_v = true
			if flipped:
				sprite.position.y -= 20
				$Sprite2D/BarrelEnd.position.y *=-1
				$Sprite2D/Sprite2D2.position.y -= 70
				$Sprite2D/Sprite2D2.flip_v = true
				flipped = false
	
	else:
		look_at(player.position)
		if shooting == 0 and canShoot:
			bullet()
			canShoot = false
			timer.start()

func bullet():
	if get_parent().name=="Player":
		var instance = kulka.instantiate()
		instance.position.x = $Sprite2D/BarrelEnd.global_position.x
		instance.position.y = $Sprite2D/BarrelEnd.global_position.y
		get_parent().add_sibling(instance)
		#instance.position.x = get_parent().position.x
		#instance.position.y = get_parent().position.y
		#get_parent().add_sibling(instance)
	else:
		var instance = kulka2.instantiate()
		instance.position.x = get_parent().position.x
		instance.position.y = get_parent().position.y
		get_parent().add_sibling(instance)

func fire(label):
	var mouse_position = get_global_mouse_position()
	var distance = global_position.distance_to(mouse_position)
	if(distance > 105):
		bullet()
		shootingSound.play()
		#ammo -= 1
		Global.currentRifleAmmo -= 1
		canShoot = false
		timer.start()
		label.text = str(Global.currentRifleAmmo,"/",maxAmmo,"x",Global.totalRifleAmmo/maxAmmo)
	
func reload(label):
	if(Global.totalRifleAmmo > 0):
		#ammo = maxAmmo
		Global.currentRifleAmmo = maxAmmo
		Global.totalRifleAmmo -= maxAmmo
		label.text = str(Global.currentRifleAmmo,"/",maxAmmo,"x",Global.totalRifleAmmo/maxAmmo)
	elif(Global.totalRifleAmmo < 35):
		#ammo = Global.submachineGunAmmo
		Global.currentRifleAmmo = Global.totalRifleAmmo
		Global.totalRifleAmmo -=  Global.totalRifleAmmo

func _on_notice_area_body_entered(body):
	if body.name == "Player":
		shooting = 0


func _on_notice_area_body_exited(body):
	if body.name == "Player":
		shooting = 1
	


func _on_shoot_timer_timeout():
	canShoot = true
