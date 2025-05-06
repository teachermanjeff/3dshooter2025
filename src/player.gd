extends CharacterBody3D  # Ensure this is on a CharacterBody3D

@export var speed: float = 5.0
@export var jump_velocity: float = 5.0
@export var mouse_sensitivity: float = 0.002  # Adjust sensitivity
var gravity = 16

@onready var head = $Head  # Reference to a pivot node
@onready var camera = $Head/Camera3D  # Camera inside the head

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)  # Lock mouse to screen

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)  # Horizontal look
		head.rotate_x(-event.relative.y * mouse_sensitivity)
		head.rotation.x = clamp(head.rotation.x, deg_to_rad(-80), deg_to_rad(80))  # Limit vertical view

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta  

	# Get movement input
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = (basis * Vector3(input.x, 0, input.y)).normalized()

	# Apply movement relative to player rotation
	velocity.x = (direction.x) * speed
	velocity.z = (direction.z) * speed

	# Jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity  
	move_and_slide()
