class_name Health
extends Node

@export var entity :CharacterBody3D
var hp :int
var hpmax :int 
var HpBar = null
var HpText = null


	
	
func set_hp(max_hp):
	hpmax = max_hp
	hp = hpmax
	if entity.is_in_group("Player"):
		HpBar =entity.get_node("HUD/HealthBar")
		HpText = HpBar.get_node("HPBar_Text")
		HpBar.max_value = hpmax
		HpBar.value = hp
		HpText.text = str(hp) +("/")+ str(hpmax)
	elif entity.is_in_group("Enemy"):
		HpBar =entity.get_node("mob_hud/SubViewport/Panel/mob_hpBar")
		
	

func takeM_damage(mdamage):
	print("I received " +str(mdamage)+" from the call")
	hp -= mdamage
	if HpBar:
		HpBar.max_value = hpmax
		HpBar.value = hp
	if HpText:
		HpText.text = str(hp) +("/")+ str(hpmax)
	print("Receiving "+str(mdamage)+"Melee Damage")
	print("after the attack it remain" +str(hp))
	if hp <= 0:
		entity.queue_free()
