extends CharacterBody3D


@export var AttackSystem :Attack
@export var HealthSystem :Health


@export var HP :int =50
@export var HPMax:int = 100
@export var MDamage:int =10
@export var DDamage:int=15

func _ready() -> void:
	HealthSystem.set_hp(HPMax)
	AttackSystem.set_dmg(MDamage,DDamage)
