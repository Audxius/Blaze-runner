extends Node

signal selected
@export var weaponTexture : CompressedTexture2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_pressed():
	selected.emit(weaponTexture)
