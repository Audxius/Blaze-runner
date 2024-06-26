extends Node2D

var hp = 10
var lootInstances = []
var rng = RandomNumberGenerator.new()
var timer
var damageTexture
var normalTexture

func _ready():
	lootInstances.append(preload("res://Scenes/LootBox/AmmoLoot.tscn"))
	lootInstances.append(preload("res://Scenes/LootBox/HealthPack.tscn"))
	damageTexture = load("res://More art/Loot stuff/lootcrateDamage.png")
	normalTexture = load("res://More art/Loot stuff/lootcrate.png")
	timer = $HitTimer


func _on_area_2d_area_entered(area):
	if area.name == "submachineGunBulletHitbox":
		takeDamage(1)
	elif area.name == "pistolBulletHitbox":
		takeDamage(2)
	elif area.name == "rifleBulletHitbox":
		takeDamage(2)
	elif area.name == "machineGunBulletHitbox":
		takeDamage(2)


func takeDamage(damage):
	hp -= damage
	$Sprite2D.texture = damageTexture
	timer.start()
	if hp <= 0:
		var random_index = rng.randi_range(0, 1) #jeigu bus daugiau loot'o
		var lootInstance = lootInstances[random_index].instantiate()
		var loot = lootInstance
		loot.position = position
		get_parent().add_child(loot)
		#get_tree().get_root().get_node("Level1").get_node("Player").get_node("CanvasLayer").get_node("score").add_score(150)
		queue_free()


func _on_timer_timeout():
	$Sprite2D.texture = normalTexture
	

