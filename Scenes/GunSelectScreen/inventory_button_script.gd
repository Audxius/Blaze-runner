extends Node

signal selectedInventory
@export var weaponTexture : CompressedTexture2D
@export var hideTexture : CompressedTexture2D
var this
# Called when the node enters the scene tree for the first time.
func _ready():
	this = $"."
	pass # Replace with function body.

func _on_pressed():
	selectedInventory.emit(weaponTexture)
	weaponTexture = null
	this.set_texture_normal(hideTexture)
