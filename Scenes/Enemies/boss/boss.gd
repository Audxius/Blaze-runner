extends CharacterBody2D

var loadedWeapon

@export var speed: = 200
@export var walkingTime = 3
var timeWalked=0
var direction: = 1
var walking = 0

var noticeSound
var canNoticeSoundPlay = true
@onready var laugh = $AudioStreamPlayer
@onready var start = $start
var fighting = false



func _ready():
	noticeSound = get_node("NoticeSound")



		



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





func _on_area_2d_body_entered(body):
	fighting = true

