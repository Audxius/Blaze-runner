extends CharacterBody2D

var speed = 1000 #kulku greitis
var lifetime = 5 #sekundes pries pasalinant kulka is atminties
var mouse_position
var player
var damage = 5

func _ready():
	player = get_parent().get_node("Player")
	mouse_position = player.position
	velocity = Vector2(player.position.x-position.x,player.position.y-position.y) #Kulku judesio kryptis
	look_at(mouse_position)
	
func _physics_process(delta):
	#Atsakinkas uz kulku judesi
	velocity=velocity.normalized()*speed*delta
	position+=velocity
	
	#Atsakinkas uz kulku pasalinima
	lifetime -= delta
	if(lifetime<=0):
		queue_free() 

	scale.x = get_parent().scale.x
	scale.y = get_parent().scale.y

func _on_hitbox_body_entered(body):
	if body.name == "Player":
		body.get_node("CanvasLayer").get_node("health").take_damage(damage)
		queue_free() 
