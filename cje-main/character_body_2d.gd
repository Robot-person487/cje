extends CharacterBody2D
@onready var my_timer = $Timer
signal bounceEntered
@export var SPEED = 200.0
@export var JUMP_VELOCITY = -300.0
@export var mode = "ambush"
var pbody
var health =100 

func _on_timer_timeout():
	
	$AnimatedSprite2D.animation="up"
	
	$Timer2.start()
	
	
func _ready():
	my_timer.wait_time =1
	$Timer2.wait_time =1.5
	$Area2D/CollisionShape2D.disabled = true
func _physics_process(delta):
	var playerPosition = GlobalVars.getPlayerLoco()
	
	if (mode == "ambush") :
		$AnimatedSprite2D.animation = "moving"
		$AnimatedSprite2D.play()
		
		if not is_on_floor():
			velocity += get_gravity() * delta
		
		velocity.x = position.direction_to(playerPosition).x * SPEED
		
		
			#velocity.x = SPEED
	else:
		velocity += get_gravity() * delta
		velocity.x = 0
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.play()
		
	
	move_and_slide()





func _on_player_dectection_body_entered(body):
	if(body.is_in_group("player")) :
		mode = "ambush"








func _on_player_body_entered(body: Node2D) -> void:
	if(body.is_in_group("player")):
		GlobalVars.setDeath(true)

func _on_player_check_body_entered(body: Node2D) -> void:
	
	if(body.is_in_group("player")):
		pbody = body
		mode = "attack"
		
		my_timer.start()
		pbody.velocity.y =-700
		



func _on_timer_2_timeout() -> void:
	
	$Area2D/CollisionShape2D.disabled=false
	
	
	mode= "ambush"
	$Area2D/CollisionShape2D.disabled=true

func _on_animated_sprite_2d_animation_finished() -> void:
	if ($AnimatedSprite2D.animation == "up"): 
		mode = "ambush"
		$AnimatedSprite2D.animation = "moving"


func _on_area_2d_body_entered(body: Node2D) -> void:
	health-=10
	
	


func _on_player_check_body_exited(body: Node2D) -> void:
	$Timer2.stop()
