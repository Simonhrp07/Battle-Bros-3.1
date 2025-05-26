extends CharacterBody3D

@export var speed = 50
var player_chase = false
var player = null

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
