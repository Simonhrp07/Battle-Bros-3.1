class_name Attack
extends Node



var meleeDmg :int
var distanceDmg:int

func set_dmg(Mdamge,DDamage):
	meleeDmg = Mdamge
	distanceDmg = DDamage
	print(meleeDmg)


#func _on_body_entered(body: Node3D) -> void:
	#print(meleeDmg)
	#if body.has_node("HealthComponent"):
		#var healthC = body.get_node("HealthComponent")
		#print(meleeDmg)
		#healthC.takeM_damage(meleeDmg)
