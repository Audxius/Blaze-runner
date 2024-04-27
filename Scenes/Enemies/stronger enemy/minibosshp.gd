extends ColorRect

var hp = 300;
var timer = 1; #kiek laiko zaidejas turi iki scenos restarto

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scale.x = hp*0.01
	if Input.is_key_pressed(KEY_J):
		take_damage(5)
	if Input.is_key_pressed(KEY_K):
		heal(5)
	#Jei zaidejas nebeturi gyvybes tasku scenai padaro restarta
	if hp <=0:
		get_parent().queue_free()
		get_parent().get_parent().get_node("Player").get_node("CanvasLayer").get_node("score").add_score(450)

#Pasalino zaidejo gyvybes taskus nurodyta kieki
func take_damage(amount):
	if hp>0:
		hp-=amount
		
#Papildo zaidejo gyvybes taskus nurodyta kieki
func heal(amount):
	if hp<100:
		hp+=amount


func _on_hitbox_area_entered(area):
	if area.name == "submachineGunBulletHitbox":
		take_damage(10)
	elif area.name == "pistolBulletHitbox":
		take_damage(20)
	elif area.name == "rifleBulletHitbox":
		take_damage(20)
