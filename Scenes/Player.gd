extends CharacterBody2D

var kulka = preload("res://Scenes/laser.tscn")

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

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
	
	if Input.is_action_pressed("mouse_left"):
		bullet()
		
		
func bullet():
	var instance = kulka.instantiate()
	instance.position.x = position.x
	instance.position.y = position.y
	add_sibling(instance)
	
	
