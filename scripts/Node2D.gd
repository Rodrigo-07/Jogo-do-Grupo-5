extends Node2D

var obstaculoScene = preload("res://scenes/Obstaculo.tscn")
var obs

func obstacle():
	obs = obstaculoScene.instance()
	add_child(obs)
	
func _ready():
	obstacle()
	pass
	


func _on_Baixo_pressed():
	pass # Replace with function body.
