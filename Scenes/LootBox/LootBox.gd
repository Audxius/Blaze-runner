extends Node2D

var hp = 10
var lootInstances = []
var rng = RandomNumberGenerator.new()
var timer
var damageTexture
var normalTexture

func _ready():
	lootInstances.append(preload("res://Scenes/LootBox/AmmoLoot.tscn"))
	damageTexture = load("res://More art/Loot stuff/lootcrateDamage.png")
	normalTexture = load("res://More art/Loot stuff/lootcrate.png")
	timer = $HitTimer


func _on_area_2d_area_entered(area):
	if area.name == "hitbox":
		takeDamage(1)


func takeDamage(damage):
	hp -= damage
	$Sprite2D.texture = damageTexture
	timer.start()
	if hp <= 0:
		var random_index = rng.randi_range(0, 0) #jeigu bus daugiau loot'o
		var lootInstance = lootInstances[random_index].instantiate()
		var loot = lootInstance
		loot.position = position
		get_parent().add_child(loot)
		queue_free()


func _on_timer_timeout():
	$Sprite2D.texture = normalTexture
