extends CharacterBody2D

var slime = preload("res://slime.tscn")
@export var SPEED = 300.0
@export var JUMP_VELOCITY = -500.0
var playerPos : Vector2 = position


func _physics_process(delta: float) -> void:
	get_input()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if velocity.y> 500:
		velocity.y+500

	GlobalVars.setPlayerLoco(position)
	# Handle jump.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
	#	velocity.x = direction * SPEED
	#	print(direction)
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func get_input():
	if Input.is_action_pressed("Jump") and is_on_floor() :
		velocity.y = JUMP_VELOCITY
	if Input.is_action_pressed("Left") :
		velocity.x = -1 * SPEED;
	elif Input.is_action_pressed("Right") :
		velocity.x = 1 * SPEED
	else :
		velocity.x = 0;
	print(velocity)
