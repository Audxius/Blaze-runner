extends CharacterBody2D

var loadedWeapon

@export var speed: = 200
@export var walkingTime = 3
var timeWalked=0
var direction: = 1
var walking = 0
@onready var animationPlayer = $AnimationPlayer
var noticeSound
var canNoticeSoundPlay = true


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	noticeSound = get_node("NoticeSound")

func _physics_process(delta: float) -> void:
	var greitis = abs(get_real_velocity().x)
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	if walking == 0:
		animationPlayer.play("Walking")
		#walks left and right
		timeWalked+=delta
		if(greitis > speed-10):
			print("siena")
			timeWalked=walkingTime+10
		if timeWalked>walkingTime:
			timeWalked=0
			direction*=-1
			scale.x*=-1
		position.x += speed*direction*delta
		move_and_slide()
	else:
		animationPlayer.play("Idle")
		



func replace_weapon(weaponPackedScene: PackedScene) -> void:
	# Delete current weapon
	if loadedWeapon:
		var playerWeapon = get_node(str(loadedWeapon.name))
		playerWeapon.queue_free()

	# Add new weapon
	var weaponInstance = weaponPackedScene.instance()
	loadedWeapon = weaponInstance
	add_child(weaponInstance)
	





func _on_notice_area_body_entered(body):
	if body.name == "Player":
		walking = 1
		if canNoticeSoundPlay == true:
			noticeSound.play(0.5)
			canNoticeSoundPlay = false


func _on_notice_area_body_exited(body):
	if body.name == "Player":
		walking = 0



