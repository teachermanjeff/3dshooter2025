extends Node3D

@export var bullet_scene: PackedScene  # Assign Bullet.tscn in Inspector
@onready var bullet_spawn = $BulletSpawn  # Ensure BulletSpawn exists
@export var fire_rate: float = 0.5  # Time between shots (adjust as needed)
@export var shoot_delay: float = 0.35  # Delay before firing bullet
@export var reload_time: float = 8.0

var can_shoot = true  # Prevents spamming
var is_reloading: bool = false


func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		shoot()
	
	
func reload():
	is_reloading = true
	$AnimationPlayer.play("Reload Animation")
	$AnimationPlayer.speed_scale = 1.0 
	$ReloadClick.play()
	await get_tree().create_timer(1.5).timeout
	$ReloadClick.play()
	
	await get_tree().create_timer(reload_time)
	is_reloading = false

func shoot():
	if can_shoot: 
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
		can_shoot = true
		
func _process(delta):
	if Input.is_action_just_pressed("reload") and not is_reloading:
		reload()
	if Input.is_action_just_pressed("shoot") and not is_reloading:
		shoot()
