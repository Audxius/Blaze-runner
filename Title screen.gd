extends Node2D

@export var scena: PackedScene
@onready var text = $Text
@onready var guy = $"The guy"
@onready var press_start = $"press start"
@onready var play_button = $MarginContainer
@onready var exit_button = $exit

var takes_input = true #prevents trying to free nodes that are already free

@export var Yoffset = 5000
@export var Ytimer = 1
@export var Xoffset = 10000
@export var Xtimer = 5

@onready var audio_stream_player_2d = $AudioStreamPlayer2D


func _ready():
	play_button.position.y -=5000




func _process(_delta):
	if Input.is_action_just_pressed("enter") and takes_input==true:
		audio_stream_player_2d.play()
		var tween = create_tween()
		tween.set_parallel(true)
		tween.tween_property(guy, "position", Vector2(guy.position.x-Xoffset,guy.position.y), Xtimer)
		tween.tween_property(text, "position", Vector2(text.position.x+Xoffset,text.position.y), Xtimer)
		tween.tween_property(play_button, "position", Vector2(play_button.position.x,play_button.position.y+Yoffset), Ytimer)
		
		
		takes_input=false
		
		get_node("/root/Title screen/press start").free()






func _on_texture_button_pressed():
	if scena == null: return
	else: get_tree().change_scene_to_packed(scena)


func _on_texture_button_2_pressed():
	get_tree().quit()
