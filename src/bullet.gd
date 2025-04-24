extends RigidBody3D

@export var speed: float = 200.0

func _ready():
	# linear_velocity = -global_transform.basis.z * speed  
	# set_as_top_level(true) 
	# await get_tree().create_timer(2).timeout
	# queue_free()
	var entity = bullet_entity.new()
	entity.add_components([Bullet, Transform, Model])

	var bullet: Bullet = entity.get_component(Bullet)
	var transform: Transform = entity.get_component(Transform)
	var model: Model = entity.get_component(Model)

	bullet.velocity = 100
	transform.transform = position
	model.model = self.get_path()
	ECS.world.add_entity(entity)
