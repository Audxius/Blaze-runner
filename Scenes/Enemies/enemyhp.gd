extends ColorRect

var hp = 1000;
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

#Pasalino zaidejo gyvybes taskus nurodyta kieki
func take_damage(amount):
	if hp>0:
		hp-=amount
		
#Papildo zaidejo gyvybes taskus nurodyta kieki
func heal(amount):
	if hp<100:
		hp+=amount





func _on_hitbox_area_entered(area):
	if area.name == "hitbox":
		take_damage(1)
