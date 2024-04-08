extends CharacterBody2D

var speed = 1000 #kulku greitis
var lifetime = 5 #sekundes pries pasalinant kulka is atminties
var mouse_position
var rng = RandomNumberGenerator.new()
var random_nr
var distance

func _ready():
	
	if get_parent().get_node("Player"):
		mouse_position = get_global_mouse_position()
		distance = position.distance_to(mouse_position)
		velocity = Vector2(mouse_position.x-position.x,mouse_position.y-position.y) #Kulku judesio kryptis
		if distance < 150:
			random_nr = 0
		else :
			random_nr = rng.randf_range(-20, 20)
		#kulkos pasisklaidymas
		velocity = Vector2(velocity.x, velocity.y - random_nr)
		look_at(mouse_position)
	
func _physics_process(delta):
	#Atsakinkas uz kulku judesi
	velocity=velocity.normalized()*speed*delta
	position+=velocity
	
	#Atsakinkas uz kulku pasalinima
	lifetime -= delta
	if(lifetime<=0):
		queue_free() 


func _on_hitbox_area_entered(area):
	if area.name != "hitbox":
		if area.name != "Notice area":
			queue_free()
