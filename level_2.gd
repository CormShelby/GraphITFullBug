extends Node3D



#
#	print("TOUCHED")
#	if area.is_in_group("tag") :
#
#		get_tree().get_first_node_in_group("win_label").show()
#		get_tree().get_first_node_in_group("return").show()
#		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
	
		






func _on_area_3d_area_entered(area):
	if area.is_in_group("tag") :
		
		get_tree().get_first_node_in_group("win_label").show()
		get_tree().get_first_node_in_group("return").show()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		
		
func _on_button_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
