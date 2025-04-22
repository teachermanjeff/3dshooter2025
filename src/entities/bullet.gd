class_name bullet_entity
extends Entity

func define_components():
    return [Bullet, Transform, Model]

func on_ready():
    var model: Model = get_component(Model)
    var bullet: Bullet = get_component(Bullet)