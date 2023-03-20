extends Node2D

var audio = AudioServer.get_bus_index("Master")

func _ready():
	$AudioStreamPlayer2D.play(true)
	$Atual.text = "Seu código atual é:"+Points.currentCode

# Botão para voltar para o menu
func _on_Button_pressed():
	get_tree().change_scene("res://scenes/menu/Menu.tscn")

# Ajuste do volume do som do jogo
func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(audio, value)
	
	if value == -30:
		AudioServer.set_bus_mute(audio,true)
	else:
		AudioServer.set_bus_mute(audio,false)
	
#Colocar save code no jogo
func _on_SaveCodeButton_pressed():
	Points.currentCode = ($LineEdit.text)
	Points.currentCodeArray.clear()
	
	for i in range(Points.currentCode.length()):
		Points.currentCodeArray.append(int(Points.currentCode[i]))
		
	Points.addSaveCode()
	Points.currentSaveCode()
	
	$Atual.text = "Seu código atual é:"+Points.currentCode
