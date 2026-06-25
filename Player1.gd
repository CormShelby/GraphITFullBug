extends CharacterBody3D

var speed
const WALKSPEED = 6
const RUNSPEED = 9

const JUMP_VELOCITY = 6
const MOUSE_SENSITIVITY = 0.001
var notice
#bob camera mouvement
const BOB_FREQ = 2.0
const BOB_AMP = 0.08
var t_bob = 0.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 9.8
var spawn_distance = 10.0
const BASE_FOV = 75.0
const FOV_CHANGE = 1.5

var graph = load("res://peinture.tscn")
var emote_base = load("res://emote.tscn")

@onready var head = $Head
@onready var camera = $Head/Camera3D
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
	
func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(BOB_FREQ * time) * BOB_AMP
	pos.x = cos(time * BOB_FREQ/2) * BOB_AMP
	return pos
	
func _input(event): #Quit game mode escape the game
	if event is InputEventKey:
		if  Input.is_action_just_pressed("echap"):
			# If ESC is pressed, release the mouse and show the cursor
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if  event is InputEventKey:
		if  event is InputEventKey:
			if Input.is_action_just_pressed("tag"):
				get_node("Head/Camera3D/PaintsprayVF/AnimationPlayer").play("Shake")
				get_tree().get_first_node_in_group("shake_sound").play()
	if  event is InputEventKey:
		if  event is InputEventKey:
			if Input.is_action_just_pressed("tag2"):
				get_node("Head/Camera3D/PaintsprayVF/AnimationPlayer").play("FLIP+BACK") # Replace with your animation name
	if event is InputEventKey:	#Close the mission before starting
		if Input.is_action_just_pressed("close_mission"):
			print("yes")
			get_tree().get_first_node_in_group("mission").hide()

func _unhandled_input(event):
	if event is InputEventMouseMotion : 
		head.rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
		camera.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))
		

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		print("gravity")
		velocity.y -= gravity * delta
	print("---")

	#handle the sprint : 

	if Input.is_action_pressed("sprint"):
		speed = RUNSPEED
	else : 
		speed = WALKSPEED
	
#	var velocity_clamped = clamp(velocity.length(),0.5, RUNSPEED * 2)
#	var target_fov = BASE_FOV + FOV_CHANGE * velocity_clamped
#	camera.fov = lerp(camera.fov, target_fov, delta * 8.0)

	#Head Bob function 
	t_bob += delta * velocity.length() * float(is_on_floor())
	camera.transform.origin = _headbob(t_bob)
	
	

	






	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if is_on_floor():
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
			
		else:
			
			velocity.x = lerp(velocity.x, direction.x * speed, delta * 10)
			velocity.z = lerp(velocity.z, direction.z * speed, delta * 10)
	else:
		velocity.x = lerp(velocity.x, direction.x * speed, delta * 4)
		velocity.z = lerp(velocity.z, direction.z * speed, delta * 4)
		

	move_and_slide()
	
#	if event is InputEventMouseButton:


func _process(delta):
	
	var peinture = graph.instantiate()
	if Input.is_action_just_pressed("spawn"):
		
		get_tree().get_first_node_in_group("env").add_child(peinture)
		peinture.global_position = self.global_position
		get_tree().get_first_node_in_group("sound_effect1").play()
		
	if Input.is_action_just_pressed("emote"):
		var emote = emote_base.instantiate()
		get_tree().get_first_node_in_group("env").add_child(emote)
		emote.global_position = self.global_position
		emote.global_rotation.y = self.global_rotation.y
	
	
	# Calculate the distance between the player (CharacterBody) and the Sprite3D
#	var distance_to_sprite = self.global_position.distance_to(sprite.global_position)
#
#	# If the player is within spawn_distance units of the Sprite3D
#	if distance_to_sprite <= spawn_distance:
#		# Check if the action "spawn" (mapped to a key or button) is pressed
#		
#			sprite.show()  # Show the Sprite3D when the action is pressed
#	else:
#		sprite.hide()  # Hide the sprite if the player is too far


 
	

	
	# Replace with function body.
