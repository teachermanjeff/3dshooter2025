class_name render_bullets
extends System

func query():
    return q.with_all([Model, Transform])

func process(entity: Entity, _delta: float):
    var model: RigidBody3D = entity.get_component(Model).model
    var transform: Vector3 = entity.get_component(Transform).transform
    
    model.position = transform
    print("[RENDER] rendering model", model, "with transform:", transform)