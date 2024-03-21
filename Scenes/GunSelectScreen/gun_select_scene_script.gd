extends Node

var weaponTextures = []
var weaponInstances = []
var inventoryButtons = []
# Called when the node enters the scene tree for the first time.
func _ready():
	weaponTextures.append(load("res://Scenes/Weapons/placeholder1.png"))
	weaponTextures.append(load("res://Scenes/Weapons/placeholder2.png"))
	weaponTextures.append(load("res://Scenes/Weapons/placeholder3.png"))
	weaponInstances.append(preload("res://Scenes/Weapons/placeholder1.tscn"))
	weaponInstances.append(preload("res://Scenes/Weapons/placeholder2.tscn"))
	weaponInstances.append(preload("res://Scenes/Weapons/placeholder3.tscn"))
	inventoryButtons.append($MarginContainer2/HBoxContainer/GridContainer/InventoryButtonScene)
	inventoryButtons.append($MarginContainer2/HBoxContainer/GridContainer/InventoryButtonScene2)
	inventoryButtons.append($MarginContainer2/HBoxContainer/GridContainer/InventoryButtonScene3)
	inventoryButtons.append($MarginContainer2/HBoxContainer/GridContainer/InventoryButtonScene4)
	inventoryButtons.append($MarginContainer2/HBoxContainer/GridContainer/InventoryButtonScene5)
	show_weapons_in_inventory()
	
#Kai paspaudziamas ginklo pasirinkimo mygtukas, pasirinktas ginklas idedamas i ginklu masyva
#ir atnaujinamas inventoriaus mygtuko atvaizdavimas
func _on_weapon_select_button_selected(weaponTexture, weaponScenePacked):
	if not Global.weapons.has(weaponScenePacked):
		for i in 5:
			if Global.weapons[i] == null:
				Global.weapons[i] = weaponScenePacked
				inventoryButtons[i].set_texture_normal(weaponTexture)
				inventoryButtons[i].weaponTexture = weaponTexture
				inventoryButtons[i].weaponScenePacked = weaponScenePacked
				inventoryButtons[i].show()
				return

#spaudziant ant ginklo, kuris inventoriuje, jis pasalinamas is ginklo masyvo
func _on_inventory_button_scene_selected_inventory(weaponScenePacked):
	for i in 5:
		if Global.weapons[i] == weaponScenePacked:
			Global.weapons[i] = null

#isejus is ginklu pasirinkimo meniu ir sugrizus ginklai, esantys masyve, atvaizduojami
#inventoriuje
func show_weapons_in_inventory():
	for i in 5:
		if Global.weapons[i] != null:
			if Global.weapons[i] == weaponInstances[0]:
				set_inventory_from_list(inventoryButtons[i], weaponInstances[0], weaponTextures[0])
			if Global.weapons[i] == weaponInstances[1]:
				set_inventory_from_list(inventoryButtons[i], weaponInstances[1], weaponTextures[1])
			if Global.weapons[i] == weaponInstances[2]:
				set_inventory_from_list(inventoryButtons[i], weaponInstances[2], weaponTextures[2])

func set_inventory_from_list(button, weapon, weaponTexture):
	button.set_texture_normal(weaponTexture)
	button.weaponTexture = weaponTexture
	button.weaponScenePacked = weapon
	button.show()
