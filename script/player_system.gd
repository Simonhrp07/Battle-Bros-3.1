extends CharacterBody3D

@export var AttackSystem :Attack
@export var HealthSystem :Health
# How fast the player moves in meters per second.
@export var speed = 14
@export var xp:int =0
@export var xpRequired :int = 1000
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75

@export var HP :int =50
@export var HPMax:int = 100
@export var MDamage:int =10
@export var DDamage:int=4


@onready var HPBar_text=$Control/HealthBar/HPBar_Text
		
func _ready() -> void:
	HealthSystem.set_hp(HP,HPMax)
	AttackSystem.set_dmg(MDamage,DDamage)
	$Control/HealthBar.max_value =HPMax
	$Control/HealthBar.value = HP
	HPBar_text.text = str(HP)+"/" + str(HPMax)
	$AttackSystem.meleeDmg =MDamage
	$AttackSystem.distanceDmg = DDamage

	
	
#movement system
var target_velocity = Vector3.ZERO

func _physics_process(delta):
	var direction = Vector3.ZERO


	if Input.is_action_pressed("move_right"):
		direction.x -= 1
	if Input.is_action_pressed("move_left"):
		direction.x += 1
	if Input.is_action_pressed("move_forward"):
		direction.z += 1
	if Input.is_action_pressed("move_backward"):
		direction.z -=1
	
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.basis = Basis.looking_at(direction)

	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed
	
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Moving the Character
	velocity = target_velocity
	move_and_slide()
	
	#movement system
	
#func _process(_delta):
	#if Input.is_action_pressed("hptest"):
		#hptest()
	#
#func hptest():
	#hp += 2
	#print(hp)
