class_name Health
extends Node


@export var hp :int
@export var hpmax :int 


	
	
func set_hp(current_hp,max_hp):
	hp = current_hp
	hpmax = max_hp

	

func damage(attack : Attack):
	pass
