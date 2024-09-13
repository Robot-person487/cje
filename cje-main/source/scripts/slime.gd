extends CharacterBody2D

signal bounceEntered

@export var SPEED = 200.0
@export var JUMP_VELOCITY = -300.0
@export var mode = "ambush"

func _physics_process(delta):
	print(mode)
	var playerPosition = GlobalVars.getPlayerLoco()
	if (mode == "ambush") :
		# Add the gravity.
		if not is_on_floor():
			velocity += get_gravity() * delta
	
		velocity.x = position.direction_to(playerPosition).x * SPEED
		# Handle jump.
		if is_on_floor():
			velocity.y += JUMP_VELOCITY
	
		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		
			#velocity.x = SPEED
	else:
		velocity += get_gravity() * delta
		velocity.x = 0
	
	move_and_slide()


func _on_bounce_area_entered(body):
	if(body.is_in_group("player")):
		bounceEntered.emit()


func _on_player_dectection_body_entered(body):
	if(body.is_in_group("player")) :
		mode = "ambush"


func _on_player_dectection_body_exited(body):
	if(body.is_in_group("player")) :
		mode = "idle"


func _on_player_death_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		GlobalVars.setDeath(true)
