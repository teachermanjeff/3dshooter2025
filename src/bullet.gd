extends RigidBody3D

@export var speed: float = 200.0

func _ready():
	# linear_velocity = -global_transform.basis.z * speed  
	# set_as_top_level(true) 
	# await get_tree().create_timer(2).timeout
	# queue_free()
	ECS.world.add_entity()