extends Node3D

var speed = 5.0
var direction = Vector3.BACK
var origin = transform.basis
var distance = 100
@onready var target: Area3D = $/"Sketchfab_model/Collada visual scene group/pCube3/Area3D"
var nodes = 0

func _physics_process(delta):
	nodes += 1
	translate(direction * speed * delta)
	
	if nodes > 60:
		nodes = 0
		direction = Vector3.FORWARD if direction == Vector3.BACK else Vector3.BACK
