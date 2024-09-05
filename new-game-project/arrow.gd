extends CharacterBody2D


const SPEED = 300.0



func _physics_process(delta: float) -> void:
	var collisionInfo = move_and_collide(velocity.normalized()*delta*SPEED)
