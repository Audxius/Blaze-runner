extends Node2D

@export var scena: PackedScene
@onready var text = $Text
@onready var guy = $"The guy"
@onready var press_start = $"press start"
@onready var play_button = $play
@onready var settings_button = $settings
@onready var exit_button = $exit
var takes_input = true #prevents trying to free nodes that are already free

func _ready():
	play_button.position.y -=5000
	settings_button.position.y -=5000
	exit_button.position.y -=5000

func _process(delta):
	if Input.is_action_just_pressed("enter") and takes_input==true:
		var tween = create_tween()
		tween.set_parallel(true)
		tween.tween_property(guy, "position", Vector2(guy.position.x-10000,guy.position.y), 5)
		tween.tween_property(text, "position", Vector2(text.position.x+10000,text.position.y), 5)
		tween.tween_property(play_button, "position", Vector2(play_button.position.x,play_button.position.y+5000), 1)
		tween.tween_property(settings_button, "position", Vector2(settings_button.position.x,settings_button.position.y+5000), 1)
		tween.tween_property(exit_button, "position", Vector2(exit_button.position.x,exit_button.position.y+5000), 1)
		takes_input=false
		get_node("/root/Title screen/press start").free()


func _on_play_pressed():
	if scena == null: return
	else: get_tree().change_scene_to_packed(scena)


func _on_settings_pressed():
	print("nepadaryta")


func _on_exit_pressed():
	get_tree().quit()
