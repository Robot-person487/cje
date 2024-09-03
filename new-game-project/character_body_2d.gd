extends CharacterBody2D


const SPEED = 300.0
const x = 0
const y = 0

func 

func _physics_process(delta: float) -> void:
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_right"):
		

	
	move_and_slide()
