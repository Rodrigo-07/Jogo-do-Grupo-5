extends Node

#Código do estado instantaneo do jogo
var currentCodeArray = []
var currentCode = ""

#checagem fase1
var stateLevel1
var whg = false
var pergunta11 = false
var pergunta12 = false
var pergunta13 = false
var pergunta14 = false

#checagem fase2
var stateLevel2
var crossingroad = false
var fios = false
var pergunta21 = false
var pergunta22 = false
var pergunta23 = false
var pergunta24 = false

#checagem fase3
var stateLevel3
var pergunta31 = false
var pergunta32 = false
var pergunta33 = false
var pergunta34 = false
var pacMan = false

var points = 0

func _process(delta):
	currentSaveCode()

func addpoint():
	points += 1
	
func addSaveCode():
	#for i in len(currentCode)
	pass
#Codigo que define save do game no estado instantaneo
func currentSaveCode():
	
	#Parte do codigo para fase 1
	if pergunta11 == false:
		stateLevel1 = 0
	elif pergunta11 != false:
		stateLevel1 = 1
	elif whg != false:
		stateLevel1 = 2
	elif pergunta12 != false:
		stateLevel1 = 3
	elif pergunta13 != false:
		stateLevel1 = 4
	elif pergunta14 != false:
		stateLevel1 = 5
		
	currentCodeArray.append(stateLevel1)
		
	#Parte do codigo para fase 2
	if pergunta21 == false:
		stateLevel2 = 0
	elif pergunta21 != false:
		stateLevel2 = 1
	elif pergunta22 != false:
		stateLevel2 = 2
	elif pergunta23 != false:
		stateLevel2 = 3
	elif crossingroad != false:
		stateLevel2 = 4
	elif pergunta24 != false:
		stateLevel2 = 5
	elif fios != false:
		stateLevel2 = 6
	
	currentCodeArray.append(stateLevel2)
	
	#Parte do codigo para fase 3
	if pergunta31 == false:
		stateLevel3 = 0
	elif pergunta31 != false:
		stateLevel3 = 1
	elif pergunta32 != false:
		stateLevel3 = 2
	elif pergunta33 != false:
		stateLevel3 = 3
	elif pergunta34 != false:
		stateLevel3 = 4
	elif pacMan != false:
		stateLevel3 = 5
		
	currentCodeArray.append(stateLevel3)
	
	currentCodeArray.append(points)
	
	#Transformando array em int
	for i in len(currentCodeArray):
		currentCode += str(currentCodeArray[i])
	
	return currentCode

