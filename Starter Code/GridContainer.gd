extends GridContainer

@export var blocks:PackedScene 
var num_blocks = 1

func _on_h_slider_value_changed(value):
	$"../RichTextLabel".text = str(value)
	num_blocks = value




func _on_button_button_down():
	if(num_blocks != 0):
		for i in range(num_blocks):
			var posx = cos((2 * PI / num_blocks) * i) * 350
			var posy = sin((2 * PI / num_blocks) * i) * 350
			_inst(Vector2(posx, posy))
			print(posx)
	
func _inst(pos):
	var instance = blocks.instantiate()
	instance.position = pos
	$"../../pivot".add_child(instance)
