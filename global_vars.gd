extends Node

var check : bool = false
var playerLoco : Vector2

func setCheck (para : bool) :
	check = para

func getCheck() :
	return check
	
func setPlayerLoco(para : Vector2) :
	playerLoco = para
	
func getPlayerLoco() :
	return playerLoco
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
