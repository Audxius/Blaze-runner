extends TextureButton

var level1Scene
var level2Scene
var level3Scene

func _ready():
	pass
	level1Scene = load("res://Scenes/Level1.tscn")
	level2Scene = load("res://Scenes/Levels/Level2.tscn")
	level3Scene = load("res://Scenes/Levels/Level3.tscn")

func on_restart_button_pressed():
	Global.reset_ammo()
	Global.start_clock()
	if Global.lastLevelFinished == 1:
		get_tree().change_scene_to_packed(level1Scene)
	if Global.lastLevelFinished == 2:
		get_tree().change_scene_to_packed(level2Scene)
	if Global.lastLevelFinished == 3:
		get_tree().change_scene_to_packed(level3Scene)
