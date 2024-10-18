extends Node2D

var slimepath = preload("res://source/scenes/slime.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (GlobalVars.getDeath()) :
		print(GlobalVars.getDeath())
		GlobalVars.setDeath(false)
		get_tree().reload_current_scene()


func _on_slime_bounce_entered():
	$player.velocity.y = -600
	$player.bounceBuildUp += 50


func _on_Death_entered(body):
	if (body.is_in_group("Death")) :
		GlobalVars.setDeath(true)


func _on_slime_2_bounce_entered() -> void:
	$player.velocity.y = -600
	$player.bounceBuildUp += 50


func _on_level_complete_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://source/scenes/game_play.tscn")
