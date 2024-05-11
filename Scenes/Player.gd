extends CharacterBody2D

var kulka = preload("res://Scenes/laser.tscn")

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var loadedWeapon

@onready var uiWeaponTextureRect = $CanvasLayer/WeaponTextureRect
@onready var uiAmmoLabel = $CanvasLayer/AmmoLabel

@onready var animationPlayer = $AnimationPlayer


func _physics_process(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		animationPlayer.play("Jump")

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	if Input.is_action_just_pressed("1"):
		if Global.weapons[0] != null:
			replace_weapon(Global.weapons[0])
	if Input.is_action_just_pressed("2"):
		if Global.weapons[1] != null:
			replace_weapon(Global.weapons[1])
	if Input.is_action_just_pressed("3"):
		if Global.weapons[2] != null:
			replace_weapon(Global.weapons[2])
	if Input.is_action_just_pressed("4"):
		if Global.weapons[3] != null:
			replace_weapon(Global.weapons[3])
	if Input.is_action_just_pressed("5"):
		if Global.weapons[4] != null:
			replace_weapon(Global.weapons[4])


	# Zaidejo vaiksciojimas
	var direction
	if Input.is_key_pressed(KEY_A):
		direction = -1;
		animationPlayer.play("Walking")
	elif Input.is_key_pressed(KEY_D):
		animationPlayer.play("Walking")
		direction = 1;
	else:
		direction = 0;
		if is_on_floor():
			animationPlayer.play("Idle")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()


func replace_weapon(weaponPackedScene):
	#delete current weapon
	if loadedWeapon != null:
		var playerWeapon = get_node(str(loadedWeapon.name))
		playerWeapon.queue_free()

	#add new weapon
	var weaponInstance = weaponPackedScene.instantiate()
	loadedWeapon = weaponInstance
	add_child(weaponInstance)
	
	#change ui weapon sprite
	var weaponSprite = weaponInstance.get_node("Sprite2D").texture
	uiWeaponTextureRect.texture = weaponSprite
	
	if(weaponInstance.maxAmmo == 0):
		uiAmmoLabel.text = "inf"
	elif(weaponInstance.name == "SubmachineGun"):
		uiAmmoLabel.text = str(Global.currentSubmachineGunAmmo,"/",weaponInstance.maxAmmo,"x",Global.totalSubmachineGunAmmo/weaponInstance.maxAmmo)
	elif(weaponInstance.name == "SilentPistol"):
		uiAmmoLabel.text = str(Global.currentPistolAmmo,"/",weaponInstance.maxAmmo,"x",Global.totalPistolAmmo/weaponInstance.maxAmmo)
	elif(weaponInstance.name == "AssaultRifle"):
		uiAmmoLabel.text = str(Global.currentRifleAmmo,"/",weaponInstance.maxAmmo,"x",Global.totalRifleAmmo/weaponInstance.maxAmmo)
	elif(weaponInstance.name == "MachineGun"):
		uiAmmoLabel.text = str(Global.currentMachineGunAmmo,"/",weaponInstance.maxAmmo,"x",Global.totalMachineGunAmmo/weaponInstance.maxAmmo)

func update_ammo_label():
	if(loadedWeapon.name == "SubmachineGun"):
		uiAmmoLabel.text = str(Global.currentSubmachineGunAmmo,"/",loadedWeapon.maxAmmo,"x",Global.totalSubmachineGunAmmo/loadedWeapon.maxAmmo)
	if(loadedWeapon.name == "SilentPistol"):
		uiAmmoLabel.text = str(Global.currentPistolAmmo,"/",loadedWeapon.maxAmmo,"x",Global.totalPistolAmmo/loadedWeapon.maxAmmo)
	if(loadedWeapon.name == "AssaultRifle"):
		uiAmmoLabel.text = str(Global.currentRifleAmmo,"/",loadedWeapon.maxAmmo,"x",Global.totalRifleAmmo/loadedWeapon.maxAmmo)
	if(loadedWeapon.name == "MachineGun"):
		uiAmmoLabel.text = str(Global.currentMachineGunAmmo,"/",loadedWeapon.maxAmmo,"x",Global.totalMachineGunAmmo/loadedWeapon.maxAmmo)


func _on_area_2d_body_entered(body):
	var screen = get_viewport_rect().size.length()
	var camera = $Camera2D
	print(position)
# Calculate the limit_left value based on position.x
	var screen_width = get_viewport_rect().size.x
	var limit_left = position.x - (screen_width / 2) 
	var limit_right = position.x + (screen_width / 2) 

# Set the limit_left property of the Camera2D node
	camera.limit_left = limit_left
	camera.limit_right = limit_right
	#var rng = RandomNumberGenerator.new()
	#var my_random_number = floor(rng.randf_range(-10.0, 10.0))
	#print(my_random_number)

