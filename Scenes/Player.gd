extends CharacterBody2D

var kulka = preload("res://Scenes/laser.tscn")

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var loadedWeapon

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

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
	elif Input.is_key_pressed(KEY_D):
		direction = 1;
	else: direction = 0;
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	
	# Saudymas
	
	#if Input.is_action_pressed("mouse_left"):
		#bullet()
		#
		#
#func bullet():
	#var instance = kulka.instantiate()
	#instance.position.x = position.x
	#instance.position.y = position.y
	#add_sibling(instance)

func replace_weapon(weaponPackedScene):
	#delete current weapon
	if loadedWeapon != null:
		var playerWeapon = get_node(str(loadedWeapon.name))
		playerWeapon.queue_free()

	#add new weapon
	var weaponInstance = weaponPackedScene.instantiate()
	loadedWeapon = weaponInstance
	add_child(weaponInstance)

