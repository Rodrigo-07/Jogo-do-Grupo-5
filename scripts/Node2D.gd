extends Node2D

var pausar = preload("res://scenes/menuOpcoes.tscn")
var pause

# Código para adicionar o obstáculo na fase 1
var obstaculoScene = preload("res://scenes/Obstaculo.tscn")
var obs

func obstacle():
	# Instância essa cena na cena da fase 1
	obs = obstaculoScene.instance()
	add_child(obs)
	
func _ready():
	obstacle()
	pass
	


func _on_Button_pressed():
	parar()
	
func parar():
	pause = pausar.instance()
	add_child(pause)

