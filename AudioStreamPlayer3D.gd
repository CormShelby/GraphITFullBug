extends AudioStreamPlayer3D
func _play(event):
	if  event is InputEventKey:
		print("go")
		if Input.is_action_just_pressed("spawn"):
			print("go1")
			get_tree().get_first_node_in_group("sound_effect1").play()
