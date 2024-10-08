extends Node

var death : bool = false
var playerLoco : Vector2
var playerHealth : float = 100.0

func setDeath (para : bool) :
	death = para

func getDeath() :
	return death
	
func setPlayerLoco(para : Vector2) :
	playerLoco = para
	
func getPlayerLoco() :
	return playerLoco

func setPlayerHealth(para: float) :
	playerHealth = para

func getPlayerHealth() :
	return playerHealth

func reducePlayerHealth (para: float) :
	playerHealth -= para
	
func addPlayerHealth (para: float) :
	playerHealth += para
