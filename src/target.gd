extends Node

func _on_body_entered(body: Node3D):
	print("[Target] hit by:", body.name)
	if body.name == "Bullet":
		State.set_targets_hit(State.targets_hit + 1)
		body.queue_free()
		
