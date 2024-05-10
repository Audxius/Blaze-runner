extends ColorRect

var hp = 300;
var timer = 1; #kiek laiko zaidejas turi iki scenos restarto
var hitAudio
var deathAudio
var canEmitHitAudio = true
var hitAudioTimer
var deathSoundTimer
var canDie = false

func _ready():
	hitAudio = $"../HitSound"
	hitAudioTimer = $"../SoundTimer"
	deathAudio = $"../DeathSound"
	deathSoundTimer = $"../DeathSoundTimer"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	scale.x = hp*0.01
	if Input.is_key_pressed(KEY_J):
		take_damage(5)
	if Input.is_key_pressed(KEY_K):
		heal(5)
	#Jei zaidejas nebeturi gyvybes tasku scenai padaro restarta
	if hp <=0 and deathSoundTimer.is_stopped():
		deathAudio.play()
		deathSoundTimer.start()
		if canDie:
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
		emit_hit_audio()
	elif area.name == "pistolBulletHitbox":
		take_damage(20)
		emit_hit_audio()
	elif area.name == "rifleBulletHitbox":
		take_damage(20)
		emit_hit_audio()
	elif area.name == "machineGunBulletHitbox":
		take_damage(15)
		emit_hit_audio()

func emit_hit_audio():
	if canEmitHitAudio == true:
		hitAudio.play()
		canEmitHitAudio = false
		hitAudioTimer.start()

func _on_sound_timer_timeout():
	canEmitHitAudio = true


func _on_death_sound_timer_timeout():
	canDie = true
