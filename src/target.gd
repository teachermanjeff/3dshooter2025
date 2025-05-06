extends Area3D

@onready var root_parent = self.get_parent().get_parent().get_parent().get_parent()

func _on_body_entered(body: Node3D):
	if body.name != "Bullet":
		return
	var tween = get_tree().create_tween()
	var reverse = get_tree().create_tween()
	tween.tween_property(root_parent, "rotation_degrees", Vector3(0, 0, 90), 0.25)
	tween.set_ease(tween.EASE_OUT_IN)
	tween.set_trans(tween.TRANS_ELASTIC)
	reverse.tween_property(root_parent, "rotation_degrees", Vector3(0, 0, 0), 0.25)
	reverse.stop()
	tween.tween_callback(func f():
		print("[Tween] reversing")
		await get_tree().create_timer(1).timeout
		reverse.play()
	)
	State.set_targets_hit(State.targets_hit + 1)
	body.queue_free()
	await get_tree().create_timer(0.3).timeout
	$ding.play()
