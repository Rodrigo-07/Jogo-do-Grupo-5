extends Node

var ip_adress :String

#checagem fase1
var whg = false
var pergunta11 = false
var pergunta12 = false
var pergunta13 = false
var pergunta14 = false

#checagem fase2
var crossingroad = false
var fios = false
var pergunta21 = false
var pergunta22 = false
var pergunta23 = false
var pergunta24 = false

#checagem fase3
var pacMan = false

var points = 0

func addpoint():
	points += 1
	
func _ready():
	
	ip_adress = IP.resolve_hostname((str(OS.get_environment("COMPUTERNAME"))), 1)
	print(ip_adress)

#variavel da cena atual (usada para o menu de opcoes)
var cena
#funcao pause
func pause():
	Points.cena = get_tree().current_scene.filename
	get_tree().paused = false
	get_tree().change_scene("res://scenes/menuOpcoes.tscn")
