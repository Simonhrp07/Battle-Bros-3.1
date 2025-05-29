class_name Attack
extends Node


var meleeDmg :int
var distanceDmg:int

func set_dmg(Mdamge,DDamage):
	meleeDmg = Mdamge
	distanceDmg = DDamage



func _on_melee_box_body_entered(body: Node3D) -> void:
	print(body)
	body.get_children()
