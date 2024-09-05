extends CharacterBody2D

@export var SPEED = 200.0
@export var JUMP_VELOCITY = -400.0

func _physics_process(delta):
	
	var playerPosition = GlobalVars.getPlayerLoco()
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	velocity.x = position.direction_to(playerPosition).x * SPEED
	# Handle jump.
	if is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
		#velocity.x = SPEED

	move_and_slide()
	move_and_slide()
