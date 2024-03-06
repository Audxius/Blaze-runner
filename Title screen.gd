extends Node2D

@export var scena: PackedScene

func _process(delta):
	if scena == null: return
	if Input.is_action_just_pressed("enter"):
		get_tree().change_scene_to_packed(scena)
