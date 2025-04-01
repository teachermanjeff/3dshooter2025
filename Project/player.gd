extends CharacterBody3D
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
@export var mouse_sensitivity: float = 0.2

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-deg_to_rad(event.relative.x * mouse_sensitivity))
		$Camera3D.rotate_x(-deg_to_rad(event.relative.y * mouse_sensitivity))
		$Camera3D.rotation.x = clamp($Camera3D.rotation.x, deg_to_rad(-89), deg_to_rad(89))

@export var speed: float = 5.0
@export var jump_velocity: float = 5.0

func _process(delta):
	var direction = Vector3.ZERO
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")

	direction += transform.basis * Vector3(input.x, 0, input.y)
	direction.y = 0
	direction = direction.normalized() if direction.length() > 0 else Vector3.ZERO
	
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	move_and_slide()
