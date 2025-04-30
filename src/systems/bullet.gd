class_name move_bullets
extends System

func query():
	return q.with_all([Bullet, Transform])

func process(entity: Entity, delta: float):
	var bullet: Bullet = entity.get_component(Bullet)
	var transform: Vector3 = entity.get_component(Transform).transform

	transform.z *= (-bullet.velocity * delta)
