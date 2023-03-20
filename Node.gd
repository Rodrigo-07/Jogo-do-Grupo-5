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

var points = 00


func addpoint():
	points += 1
	
func addSaveCode():
	
	#define estado dos niveis
	stateLevel1 = currentCodeArray[0]
	stateLevel2 = currentCodeArray[1]
	stateLevel3 = currentCodeArray[2]

	#define estado dos pontos
	if currentCodeArray.size() == 4:
		points = currentCodeArray[3]
	elif currentCodeArray.size() == 5:
		points = int(str(currentCodeArray[3])+str(currentCodeArray[4]))
	
	#muda cada parte das fases definindo em qual parte do jogo o player está
	if stateLevel1 == 0:
		pergunta11 =  false
	if stateLevel1 == 1:
		pergunta11 =  true
	if stateLevel1 == 2:
		whg =  true
	if stateLevel1 == 3:
		pergunta12 =  true
	if stateLevel1 == 4:
		pergunta13 =  true
	if stateLevel1 == 5:
		pergunta14 = true
	
	if stateLevel2 == 0:
		pergunta21 = false
	if stateLevel2 == 1:
		pergunta21 = true
	if stateLevel2 == 2:
		pergunta22 = true
	if stateLevel2 == 3:
		pergunta23 = true
	if stateLevel2 == 4:
		crossingroad = true
	if stateLevel2 == 5:
		pergunta24 = true
	if stateLevel2 == 6:
		fios = true
		
	if stateLevel3 == 0:
		pergunta31 =  false
	if stateLevel3 == 1:
		pergunta31 =  true
	if stateLevel3 == 2:
		pergunta32 =  true
	if stateLevel3 == 3:
		pergunta33 =  true
	if stateLevel3 == 4:
		pergunta34 =  true
	if stateLevel3 == 5:
		pacMan = true
	
	return currentCodeArray


#Codigo que define save do game no estado instantaneo
func currentSaveCode():
	
	#Parte do codigo para fase 1
	if pergunta11 == false:
		stateLevel1 = 0
	if pergunta11 != false:
		stateLevel1 = 1
	if whg != false:
		stateLevel1 = 2
	if pergunta12 != false:
		stateLevel1 = 3
	if pergunta13 != false:
		stateLevel1 = 4
	if pergunta14 != false:
		stateLevel1 = 5
		
	#Parte do codigo para fase 2
	if pergunta21 == false:
		stateLevel2 = 0
	if pergunta21 != false:
		stateLevel2 = 1
	if pergunta22 != false:
		stateLevel2 = 2
	if pergunta23 != false:
		stateLevel2 = 3
	if crossingroad != false:
		stateLevel2 = 4
	if pergunta24 != false:
		stateLevel2 = 5
	if fios != false:
		stateLevel2 = 6
	
	#Parte do codigo para fase 3
	if pergunta31 == false:
		stateLevel3 = 0
	if pergunta31 != false:
		stateLevel3 = 1
	if pergunta32 != false:
		stateLevel3 = 2
	if pergunta33 != false:
		stateLevel3 = 3
	if pergunta34 != false:
		stateLevel3 = 4
	if pacMan != false:
		stateLevel3 = 5
	
	currentCodeArray.clear()
	currentCodeArray.append(stateLevel1)
	currentCodeArray.append(stateLevel2)
	currentCodeArray.append(stateLevel3)
	currentCodeArray.append(points)
	
	currentCode = ""
	#Transformando array em int
	for i in len(currentCodeArray):
		currentCode += str(currentCodeArray[i])
	
	return currentCode
