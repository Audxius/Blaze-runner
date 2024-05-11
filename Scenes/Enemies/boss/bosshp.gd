extends ColorRect

var hp = 4000;
var timer = 1; #kiek laiko zaidejas turi iki scenos restarto
var hitAudio
var canEmitHitAudio = true
var hitAudioTimer
var scoreScene

func _ready():
	hitAudio = $"../HitSound"
	hitAudioTimer = $"../Timer"
	scoreScene = preload("res://Scenes/ScoreScreen/ScoreScene.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scale.x = hp*0.001
	if Input.is_key_pressed(KEY_J):
		take_damage(5)
	if Input.is_key_pressed(KEY_K):
		heal(5)
	#Jei zaidejas nebeturi gyvybes tasku scenai padaro restarta
	if hp <=0:
		get_parent().get_parent().get_node("Player").get_node("CanvasLayer").get_node("score").add_score(2000)
		Global.save_level3_score()
		get_tree().call_deferred("change_scene_to_packed", scoreScene)
		get_parent().queue_free()
		

#Pasalino zaidejo gyvybes taskus nurodyta kieki
func take_damage(amount):
	if(get_parent().fighting):
		if hp>0:
			hp-=amount
		
#Papildo zaidejo gyvybes taskus nurodyta kieki
func heal(amount):
	if hp<100:
		hp+=amount


func _on_hitbox_area_entered(area):
	if area.name == "submachineGunBulletHitbox":
		take_damage(10)
		#emit_hit_audio()
	elif area.name == "pistolBulletHitbox":
		take_damage(20)
		#emit_hit_audio()
	elif area.name == "rifleBulletHitbox":
		take_damage(20)
		#emit_hit_audio()
	elif area.name == "machineGunBulletHitbox":
		take_damage(15)
		#emit_hit_audio()


func emit_hit_audio():
	if canEmitHitAudio == true:
		hitAudio.play()
		canEmitHitAudio = false
		hitAudioTimer.start()

func _on_timer_timeout():
	canEmitHitAudio = true
