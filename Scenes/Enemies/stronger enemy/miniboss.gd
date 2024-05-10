extends CharacterBody2D

var loadedWeapon

@export var speed: = 100
const JUMP_VELOCITY = -400.0
@export var walkingTime = 3
var timeWalked=0
var direction = 1:
	set(val):
		if val != direction: scale.x *= -1
		direction = val
var walking = 0
var ogscale
@onready var animationPlayer = $animationPlayer
var noticeSound
var canNoticeSoundPlay = true



var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	noticeSound = get_node("NoticeSound")


func _physics_process(delta: float) -> void:
	var greitis = abs(get_real_velocity().x)
	

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
	if(greitis > speed-10 and is_on_floor()):
		velocity.y = JUMP_VELOCITY
	move_and_slide()
		

func _on_notice_area_body_entered(body):
	if body.name == "Player":
		walking = 1
		if canNoticeSoundPlay == true:
			noticeSound.play(0.5)
			canNoticeSoundPlay = false
	print("seen")
