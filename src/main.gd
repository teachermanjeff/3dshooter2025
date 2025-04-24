extends Node3D

func _process(delta: float):
	ECS.process(delta)
