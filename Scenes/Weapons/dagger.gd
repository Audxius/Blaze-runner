extends Node2D

var animation
var sound
var inAnimation = false

var damage = 25

# Called when the node enters the scene tree for the first time.
func _ready():
	animation = get_node("AttackAnim")
	sound = get_node("AttackSound")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())

	if Input.is_action_pressed("mouse_left"):
		if not inAnimation:
			sound.play()
			animation.play("dagger_attack")
			inAnimation = true

func _on_attack_anim_animation_finished(anim_name):
	inAnimation = false


func _on_body_entered(body):
	if(inAnimation):
		if body.has_method("take_damage"):
			body.take_damage(damage)
