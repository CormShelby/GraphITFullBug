extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass







func _on_quit_game_pressed():
	get_tree().quit()
	


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://first_scene.tscn") # Replace with function body.


func _on_options_pressed():
	get_tree().change_scene_to_file("res://control.tscn")
