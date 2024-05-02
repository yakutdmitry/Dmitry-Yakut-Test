extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var explosion_scene:PackedScene

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		move_and_slide()
	if is_on_floor():
		queue_free()
		_inst()
	
func _inst():
	var instance = explosion_scene.instantiate()
	instance.global_position = global_position
	instance.emitting = true
	add_child(instance)
	
