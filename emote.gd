extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	var children = self.get_children()
	for child in children:
		child.hide()
	
	children.pick_random().show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
