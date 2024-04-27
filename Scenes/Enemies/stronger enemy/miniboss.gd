extends CharacterBody2D

var loadedWeapon

@export var speed: = 100
@export var walkingTime = 3
var timeWalked=0
var direction = 1:
	set(val):
		if val != direction: scale.x *= -1
		direction = val
var walking = 0
var ogscale
@onready var animationPlayer = $animationPlayer




var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")



func _physics_process(delta: float) -> void:
	 #Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	animationPlayer.play("walking")
	if(walking == 1):
		if(get_parent().get_node("Player").position.x>position.x):
			direction = 1
			#print("right")
		else:
			direction = -1

			#print("left")
		position.x += speed*direction*delta	
	else:
		timeWalked+=delta
		if timeWalked>walkingTime:
			timeWalked=0
			direction*=-1
			#scale.x*=-1
		position.x += speed*direction*delta
	move_and_slide()
		#move_and_slide()
		#
		
		
	#if walking == 0:
		
		##walks left and right
		#timeWalked+=delta
		#if timeWalked>walkingTime:
			#timeWalked=0
			#direction*=-1
			#scale.x*=-1
		#position.x += speed*direction*delta
		#move_and_slide()
	#else:
		#animationPlayer.play("Idle")
#
#
#func replace_weapon(weaponPackedScene: PackedScene) -> void:
	## Delete current weapon
	#if loadedWeapon:
		#var playerWeapon = get_node(str(loadedWeapon.name))
		#playerWeapon.queue_free()
#
	## Add new weapon
	#var weaponInstance = weaponPackedScene.instance()
	#loadedWeapon = weaponInstance
	#add_child(weaponInstance)
	#





func _on_notice_area_body_entered(body):
	if body.name == "Player":
		walking = 1
	print("seen")




