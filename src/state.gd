class_name local_state
extends Node

@export var targets_hit: int = 0
signal on_hit

func set_targets_hit(value: int):
    targets_hit = value
    on_hit.emit(value)