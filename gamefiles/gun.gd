extends Node3D

@export var bullet_scene: PackedScene  # Assign Bullet.tscn in Inspector
@onready var bullet_spawn = $BulletSpawn  # Ensure BulletSpawn exists
@export var fire_rate: float = 0.27  # Time between shots (adjust as needed)
@export var shoot_delay: float = 0.35  # Delay before firing bullet
@export var reload_time: float = 8.0
@export var last_shot:float = 0

var can_shoot = true  # Prevents spamming
var is_reloading: bool = false
const Max_ammo = 6
var current_ammo = Max_ammo

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT and current_ammo >= 1:
		shoot()
	
func reload():
	is_reloading = true
	$AnimationPlayer.play("Reload Animation")
	$AnimationPlayer.speed_scale = 1.0 
	$ReloadClick.play()
	await get_tree().create_timer(1.5).timeout
	$ReloadClick.play()
	current_ammo = Max_ammo
	await get_tree().create_timer(reload_time)
	is_reloading = false

func shoot():
<<<<<<< HEAD
	if !$AnimationPlayer.is_playing():
		await get_tree().create_timer(0.2)
		$DryFireClick.play()
		if can_shoot == true: 
			can_shoot = false  # Prevents immediate re-firing       
			$AnimationPlayer.play("Shooting animation")
			$AnimationPlayer.speed_scale = 4.0 
			await get_tree().create_timer(shoot_delay).timeout
			if bullet_scene:
				var bullet = bullet_scene.instantiate()
				get_parent().add_child(bullet)  
				bullet.global_transform = $BulletSpawn.global_transform  # Correct direction
				await get_tree().create_timer(fire_rate).timeout
				$Gunshot.play()
				current_ammo -= 1
			can_shoot = true
=======
	await get_tree().create_timer(0.2)
	$DryFireClick.play()
	if can_shoot == true: 
		can_shoot = false  # Prevents immediate re-firing       
		$AnimationPlayer.play("Shooting animation")
		$AnimationPlayer.speed_scale = 4.0 
		await get_tree().create_timer(shoot_delay).timeout
		#if bullet_scene:
		var bullet = bullet_scene.instantiate()
		get_parent().add_child(bullet)  
		bullet.global_transform = $BulletSpawn.global_transform  # Correct direction
		await get_tree().create_timer(fire_rate).timeout
		$Gunshot.play()
		current_ammo -= 1
		can_shoot = true
		
>>>>>>> main
	#if can_shoot == false:  THIS MAKES IT CLICK TWICE BECAUSE OF THE PREVENTING IMMEDIATE REFIREING
	#	$DryFireClick.play()
		
func _process(delta):
	if Input.is_action_just_pressed("reload") and not is_reloading:
		reload()
	if Input.is_action_just_pressed("shoot") and not is_reloading:
		shoot()
	if current_ammo > 0:
		can_shoot = true
	if current_ammo <= 0:
		can_shoot = false
	#wprint(current_ammo)
