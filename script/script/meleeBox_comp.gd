class_name HitboxComp
extends Node

@export var attackSys :Attack




func _on_body_entered(body: Node3D) -> void:
	if body.has_node("HealthComponent"):
		print(attackSys.meleeDmg)
		body.get_node("HealthComponent").takeM_damage(attackSys.meleeDmg)
		
