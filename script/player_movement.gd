extends CharacterBody3D

var speed = 5.0  # Vitesse de déplacement du personnage

func _physics_process(delta):
	# Récupérer l'entrée de l'utilisateur
	var input_direction = Vector3(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		0,
		Input.get_action_strength("move_back") - Input.get_action_strength("move_forward")
	).normalized()

	# Calculer la direction de déplacement en fonction de la rotation du personnage
	var transform_input = global_transform.basis.xform(input_direction)
	velocity.x = transform_input.x * speed
	velocity.z = transform_input.z * speed

	# Appliquer le mouvement
	move_and_slide()
