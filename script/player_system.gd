extends CharacterBody3D


# How fast the player moves in meters per second.
@export var speed = 14
@export var hp :float = 50.0
@export var hpmax :float = 50.0
@export var xp:int =0
@export var xpRequired :int = 1000
@export var distanceDmg:int = 5
@export var melleDmg:int = 12
# The downward acceleration when in the air, in meters per second squared.

var timer :Timer =Timer.new()
#movement system
var target_velocity = Vector3.ZERO

func _physics_process(_delta):
	var direction = Vector3.ZERO


	if Input.is_action_pressed("move_right"):
		direction.x += 1
		print("d")
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
		print("q")
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
		print("z")
	if Input.is_action_pressed("move_backward"):
		direction.z +=1
		print("s")
	
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		#$Pivot.basis = Basis.looking_at(direction)

	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# Moving the Character
	velocity = target_velocity
	move_and_slide()
	#movement system
	
func _process(_delta):
	if Input.is_action_pressed("hptest"):
		timer.wait_time =1.0
		hptest()
	
func hptest():
	hp += 2
	print(hp)
