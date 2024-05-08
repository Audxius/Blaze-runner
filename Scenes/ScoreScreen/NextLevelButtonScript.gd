extends TextureButton

@export var level2ScenePath: NodePath
@export var level3ScenePath: NodePath
var gunSelectScene

func _ready():
	gunSelectScene = load("res://Scenes/GunSelectScreen/GunSelectScene.tscn")
	#level2Scene = load("res://Scenes/Levels/Level2.tscn")
	#level3Scene = load("res://Scenes/Levels/Level3.tscn")

func _on_next_level_button_pressed():
	Global.totalSubmachineGunAmmo = 175
	Global.currentSubmachineGunAmmo = 35
	Global.totalPistolAmmo = 40
	Global.currentPistolAmmo = 10
	Global.totalRifleAmmo = 90
	Global.currentRifleAmmo = 30
	if Global.lastLevelFinished == 1:
		Global.goToLevel = level2ScenePath
		get_tree().change_scene_to_packed(gunSelectScene)
		#get_tree().change_scene_to_packed(level2Scene)
	if Global.lastLevelFinished == 2:
		Global.goToLevel = level3ScenePath
		get_tree().change_scene_to_packed(gunSelectScene)
		#get_tree().change_scene_to_packed(level3Scene)
