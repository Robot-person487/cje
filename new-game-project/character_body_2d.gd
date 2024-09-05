extends CharacterBody2D
const arrowpath = preload("res://arrow.tscn")


func shoot():
	var arrow = arrowpath.instantiate()
	
	get_parent().add_child(arrow)
	arrow.position= $Marker2D.global_position
	arrow.velocity= get_global_mouse_position()-arrow.position
func _ready():
	pass

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Left_click"):
		shoot()
	move_and_slide()
