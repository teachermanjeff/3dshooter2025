extends Node

func _on_body_entered(body: Node3D):
	if body.name == "Bullet":
		body.queue_free()