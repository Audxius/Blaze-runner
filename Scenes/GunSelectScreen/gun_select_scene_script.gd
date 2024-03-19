extends Node

var weaponTextures = []
var inventoryButtons = []
# Called when the node enters the scene tree for the first time.
func _ready():
	weaponTextures.append(load("res://Scenes/Weapons/placeholder1.png"))
	weaponTextures.append(load("res://Scenes/Weapons/placeholder2.png"))
	inventoryButtons.append($MarginContainer2/HBoxContainer/GridContainer/InventoryButtonScene)
	inventoryButtons.append($MarginContainer2/HBoxContainer/GridContainer/InventoryButtonScene2)
	inventoryButtons.append($MarginContainer2/HBoxContainer/GridContainer/InventoryButtonScene3)
	inventoryButtons.append($MarginContainer2/HBoxContainer/GridContainer/InventoryButtonScene4)
	inventoryButtons.append($MarginContainer2/HBoxContainer/GridContainer/InventoryButtonScene5)
	show_weapons_in_inventory()
	

func show_weapons_in_inventory():
	for i in 5:
		if Global.weapons[i] != null:
			inventoryButtons[i].set_texture_normal(Global.weapons[i])
			inventoryButtons[i].weaponTexture = Global.weapons[i]
			inventoryButtons[i].show()

func _on_weapon_select_button_selected(weaponTexture):
	if not Global.weapons.has(weaponTexture):
		for i in 5:
			if Global.weapons[i] == null:
				Global.weapons[i] = weaponTexture
				inventoryButtons[i].set_texture_normal(weaponTexture)
				inventoryButtons[i].weaponTexture = weaponTexture
				inventoryButtons[i].show()
				return

func _on_inventory_button_scene_selected_inventory(weaponTexture):
	for i in 5:
		if Global.weapons[i] == weaponTexture:
			Global.weapons[i] = null
