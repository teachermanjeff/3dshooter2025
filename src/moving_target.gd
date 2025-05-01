extends Node3D

var speed = 5.0
var direction = Vector3.BACK

func _physics_process(delta):
	translate(direction * speed * delta)

func _on_LeftLimit_body_entered(body):
	if body == self:
		direction = Vector3.BACK

func _on_RightLimit_body_entered(body):
	if body == self:
		direction = Vector3.FORWARD
