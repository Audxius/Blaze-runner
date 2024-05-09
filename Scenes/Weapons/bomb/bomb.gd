extends CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const SPAWN = preload("res://Scenes/Weapons/bomb/explosion.tscn")
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		queue_free()
		var spawn = SPAWN.instantiate()
		spawn.position = position
		get_parent().add_child(spawn)
		
	move_and_slide()

