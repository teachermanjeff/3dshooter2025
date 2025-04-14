class_name move_bullets
extends System

func query():
    return q.with_all([Bullet, Transform])

func process(entity: Entity, delta: float):
    var velocity = entity.get_component(Bullet).velocity    