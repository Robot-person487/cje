extends CharacterBody2D

@export var SPEED = 3000.0
@export var JUMP_VELOCITY = -500.0
var playerPos : Vector2 = position
var bounceBuildUp = 0
@onready var playerAnim: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	get_input()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		playerAnim.play("in_air")
	else :
		bounceBuildUp = 0
		

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
		playerAnim.flip_h = true;
		playerAnim.play("walk")
	elif Input.is_action_pressed("Right") :
		velocity.x = 1 * SPEED
		playerAnim.flip_h = false;
		playerAnim.play("walk")
	else :
		velocity.x = 0;
		playerAnim.play("idle")
