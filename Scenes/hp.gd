extends ColorRect

var hp = 100;
var timer = 1; #kiek laiko zaidejas turi iki scenos restarto

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scale.x = hp*0.01
	if Input.is_key_pressed(KEY_G):
		take_damage(5)
	if Input.is_key_pressed(KEY_H):
		heal(5)
	#Jei zaidejas nebeturi gyvybes tasku scenai padaro restarta
	if hp <=0:
		timer-=delta
		if timer<=0:
			get_tree().reload_current_scene()

#Pasalino zaidejo gyvybes taskus nurodyta kieki
func take_damage(amountToTake):
	if hp>0:
		hp-=amountToTake
		
#Papildo zaidejo gyvybes taskus nurodyta kieki
func heal(amount):
	if hp<100:
		hp+=amount
