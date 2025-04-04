extends RigidBody3D

@export var speed: float = 10.0  

func _ready():
	linear_velocity = -global_transform.basis.z * speed  
	set_as_top_level(true)  # Detach bullet from parent to prevent unwanted movement

func _on_body_entered(body):
	queue_free()  # Destroy bullet on impact
