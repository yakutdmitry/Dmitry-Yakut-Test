extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var explosion_scene:PackedScene

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		
		move_and_slide()
	if is_on_floor():
		inst(true, Vector2(0, 400))
		queue_free()
		
	
#func _inst():
	#var instance = explosion_scene.instantiate()
	#instance.global_position = global_position
	#instance.emitting = true
	#add_child(instance)
	#
func inst(on, pos):
	var explosion = explosion_scene.instantiate()
	explosion.position = pos
	explosion.emitting = on
	$"..".add_child(explosion)

