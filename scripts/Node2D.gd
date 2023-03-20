extends Node2D



# Código para adicionar o obstáculo na fase 1
var obstaculoScene = preload("res://scenes/Obstaculo.tscn")
var obs

func obstacle():
	# Instância essa cena na cena da fase 1
	obs = obstaculoScene.instance()
	add_child(obs)
var pontos = "Você tem " + str(Points.points) + " pontos"
func _ready():
	obstacle()
	$FundoPause/Label.text = pontos
	
#pause:
var audio = AudioServer.get_bus_index("Master")

func _on_Pausar_pressed():
	get_tree().paused = true
	$FundoPause.show()

func _on_Button2_pressed():
	get_tree().paused = false
	$FundoPause.hide()
	

func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(audio, value)
	if value == -30:
		AudioServer.set_bus_mute(audio,true)
	else:
		AudioServer.set_bus_mute(audio,false)
	
