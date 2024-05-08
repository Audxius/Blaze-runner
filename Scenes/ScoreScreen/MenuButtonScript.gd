extends TextureButton

var mainMenuScene

func _ready():
	pass
	mainMenuScene = load("res://Title screen.tscn")


func _on_menu_button_pressed():
	Global.totalSubmachineGunAmmo = 175
	Global.currentSubmachineGunAmmo = 35
	Global.totalPistolAmmo = 40
	Global.currentPistolAmmo = 10
	Global.totalRifleAmmo = 90
	Global.currentRifleAmmo = 30
	get_tree().change_scene_to_packed(mainMenuScene)

