extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var explosion_scene:PackedScene

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
		$Sprite2D2.position = $".".position
		move_and_slide()
	if is_on_floor():
		inst(true)
		queue_free()
		

func inst(on):
	var explosion = explosion_scene.instantiate()
	explosion.position = $Sprite2D2.position
	explosion.emitting = on
	$"..".add_child(explosion)

