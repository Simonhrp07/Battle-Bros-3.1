extends Node3D


@onready var enemy = preload("res://scene/mob.tscn")


func _on_timer_timeout() -> void:
	var ene = enemy.instantiate()
	ene.position = position
	get_parent().add_child(ene)
