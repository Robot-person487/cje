extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_input()
	$Container/ProgressBar.value = GlobalVars.getPlayerHealth()
	print(GlobalVars.getPlayerHealth())

func get_input():
	if (Input.is_action_just_pressed("Pause")) :
		if(get_tree().paused) :
			get_tree().paused = false
		else :
			get_tree().paused = true
