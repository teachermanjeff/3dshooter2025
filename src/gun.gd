extends Node3D

@export var bullet_scene: PackedScene  # Assign Bullet.tscn in Inspector
@onready var bullet_spawn = $BulletSpawn  # Ensure BulletSpawn exists
@export var fire_rate: float = 0.27  # Time between shots (adjust as needed)
@export var shoot_delay: float = 0.35  # Delay before firing bullet
@export var reload_time: float = 8.0

const MAX_AMMO = 6

var state = {
	reloading = false,
	firing = false,
	ammo = 6
}
		
func wait(amount):
	await get_tree().create_timer(amount).timeout
	
func reload():
	state.reloading = true
	$AnimationPlayer.play("Reload Animation")
	$AnimationPlayer.speed_scale = 1.0 
	$ReloadClick.play()
	await wait(1.5)
	$ReloadClick.play()
	state.ammo = MAX_AMMO
	wait(reload_time)
	state.reloading = false

func shoot():
	if state.firing:
		return

	state.firing = true
	state.ammo -= 1
	await wait(0.2)
	$DryFireClick.play()
	$AnimationPlayer.play("Shooting animation")
	$AnimationPlayer.speed_scale = 4.0 
	await wait(shoot_delay)
	var bullet = bullet_scene.instantiate()
	get_parent().add_child(bullet)  
	bullet.global_transform = $BulletSpawn.global_transform
	await wait(fire_rate)
	$Gunshot.play()
	state.firing = false
		
func _process(delta):
	if Input.is_action_just_pressed("reload") and not state.reloading:
		reload()
	if Input.is_action_just_pressed("shoot") and not (state.firing or state.reloading) and state.ammo > 0:
		shoot()
