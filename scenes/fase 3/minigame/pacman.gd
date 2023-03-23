extends Node2D

var audio = AudioServer.get_bus_index("Master")
func _ready():
	$FundoPause/Label.text = pontos
	$FundoPause/Label2.text = "Seu código atual é:"+ Points.currentCode
	$AnimatedSprite.play("default")
func _on_Pausar_pressed():
	get_tree().paused = true
	$FundoPause.show()

func _on_Button2_pressed():
	get_tree().paused = false
	$FundoPause.hide()
	
var pontos = "Você tem " + str(Points.points) + " pontos"
func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(audio, value)
	if value == -30:
		AudioServer.set_bus_mute(audio,true)
	else:
		AudioServer.set_bus_mute(audio,false)
	


func _on_Button3_pressed():
	get_tree().change_scene("res://scenes/menu/main_interface.tscn")
