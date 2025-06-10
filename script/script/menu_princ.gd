extends Control




func _on_btn_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/main.tscn")


func _on_btn_upgrade_pressed() -> void:
	print("upgrade work")


func _on_btn_shop_pressed() -> void:
	print("shop work")
