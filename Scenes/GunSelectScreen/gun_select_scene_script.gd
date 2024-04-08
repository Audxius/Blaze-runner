extends Node

var weaponTextures = []
var weaponInstances = []
var inventoryButtons = []
# Called when the node enters the scene tree for the first time.
func _ready():
	weaponTextures.append(load("res://Scenes/Weapons/dagger.png"))
	weaponTextures.append(load("res://Scenes/Weapons/placeholder1.png"))
	weaponInstances.append(preload("res://Scenes/Weapons/dagger.tscn"))
	weaponInstances.append(preload("res://Scenes/Weapons/submachinegun.tscn"))
	inventoryButtons.append($MarginContainer2/HBoxContainer/InventoryButtonScene)
	inventoryButtons.append($MarginContainer2/HBoxContainer/InventoryButtonScene2)
	inventoryButtons.append($MarginContainer2/HBoxContainer/InventoryButtonScene3)
	inventoryButtons.append($MarginContainer2/HBoxContainer/InventoryButtonScene4)
	inventoryButtons.append($MarginContainer2/HBoxContainer/InventoryButtonScene5)
	show_weapons_in_inventory()
	
#Kai paspaudziamas ginklo pasirinkimo mygtukas, pasirinktas ginklas idedamas i ginklu masyva
#ir atnaujinamas inventoriaus mygtuko atvaizdavimas
func _on_weapon_select_button_selected(weaponTexture, weaponScenePacked):
	if not Global.weapons.has(weaponScenePacked):
		for i in 5:
			if Global.weapons[i] == null:
				Global.weapons[i] = weaponScenePacked
				inventoryButtons[i].get_node("TextureRect").texture = weaponTexture
				#inventoryButtons[i].weaponTexture = weaponTexture
				inventoryButtons[i].weaponScenePacked = weaponScenePacked
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

func set_inventory_from_list(button, weapon, weaponTexture):
	button.get_node("TextureRect").texture = weaponTexture
	#button.weaponTexture = weaponTexture
	button.weaponScenePacked = weapon
	button.show()
