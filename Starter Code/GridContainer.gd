extends GridContainer


func _on_h_slider_value_changed(value):
	$"../RichTextLabel".text = str(value)
