extends Node2D

var kulka = preload("res://Scenes/laser.tscn")
var kulka2 = preload("res://Scenes/Enemies/enemylaser.tscn")
const BOMBSPAWN = preload("res://Scenes/Weapons/bomb/bombspawn.tscn")
@onready var laugh = $"../AudioStreamPlayer"

@onready var audio = $"../AudioStreamPlayer"
var player
var canshoot = false
var shootshoot = false
var shoottimer = true
@onready var timer = $"../Timer"
@onready var shootfor = $"../shootfor"
var shootingSound
var screen_width
var attacking = false
@onready var cooldown = $"../cooldown"


# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_parent().get_node("Player")	
	shootingSound = get_node("ShootingSound")
	timer.start()
	screen_width = get_viewport_rect().size.x
	cooldown.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(player.position)
	if(shootshoot == true):
		if (shootfor.time_left>0):
			shoot()




func bullet():
	var instance = kulka2.instantiate()
	shootingSound.play()
	instance.position.x = get_parent().position.x
	instance.position.y = get_parent().position.y
	get_parent().add_sibling(instance)


func _on_area_2d_body_entered(body):
	if(body.name=="Player"):
		canshoot = true;
		
func bomb1():
	for i in 5:
		var bomb = BOMBSPAWN.instantiate()
		bomb.position.x = position.x - (screen_width/5 * (i - 0.6)+230)
		bomb.position.y = 270
		get_parent().add_child(bomb)
		
func bomb2():
	for i in 4:
		var bomb = BOMBSPAWN.instantiate()
		bomb.position.x = position.x - (screen_width/5 * (i - 0.6)+330)
		bomb.position.y = 270
		get_parent().add_child(bomb)
		
func shoot():
	if (canshoot and shoottimer):
		look_at(player.position)
		bullet()
		shoottimer=false
	if(timer.time_left<=0):
		shoottimer=true
		timer.start()



func _on_start_timeout():
	attacking = true


func _on_cooldown_timeout():
	if(get_parent().fighting):
		shootshoot = false
		shootfor.start()
		var random_number = randi() % 3 + 1
		print("Random number: ", random_number)
		if(random_number == 1):
			bomb1()
		elif(random_number == 2):
			bomb2()
		else:
			shootshoot = true
			laugh.play()
	cooldown.start()
	

