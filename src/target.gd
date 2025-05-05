extends Node

func _on_body_entered(body: Node3D):
	await get_tree().create_timer(randf_range(0.1, 0.5)).timeout
	if body.name == "Bullet":
		State.set_targets_hit(State.targets_hit + 1)
		body.queue_free()
		await get_tree().create_timer(0.3).timeout
		$ding.play()
