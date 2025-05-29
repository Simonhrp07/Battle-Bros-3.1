extends CharacterBody3D


@export var AttackSystem :Attack
@export var HealthSystem :Health

@export var speed = 50
var player_chase = false
var player = null

@export var HP :int =50
@export var HPMax:int = 100
@export var MDamage:int =10
@export var DDamage:int=15

func _ready() -> void:
	HealthSystem.set_hp(HP,HPMax)
	AttackSystem.set_dmg(MDamage,DDamage)

func _physics_process(delta: float) -> void:
	if player_chase:
		position += (player.position - position)/speed

func _on_area_3d_body_entered(body: Node3D) -> void:
	player = body
	player_chase = true


func _on_area_3d_body_exited(body: Node3D) -> void:
	await get_tree().create_timer(2).timeout
	player = null
	player_chase = false
