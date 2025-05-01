extends Node

func _on_body_entered(body: Node3D):
	if body.name == "Bullet":
		State.set_targets_hit(State.targets_hit + 1)
		body.queue_free()
		await get_tree().create_timer(0.3).timeout
		$ding.play()
