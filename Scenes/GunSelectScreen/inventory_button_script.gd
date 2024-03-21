extends Node

signal selectedInventory
#@export var weaponTexture : CompressedTexture2D
@export var hideTexture : CompressedTexture2D
@export var weaponScenePacked : PackedScene
var this
# Called when the node enters the scene tree for the first time.
func _ready():
	this = $"."
	pass # Replace with function body.

func _on_pressed():
	selectedInventory.emit(weaponScenePacked)
	#weaponTexture = null
	weaponScenePacked = null
	this.get_node("TextureRect").texture = hideTexture
