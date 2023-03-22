extends Node2D

var errou = load("res://sprites/Buttonvermelho.png")
var acertou = load("res://sprites/Buttonverde.png")

func _ready():
	$Points.text = str(Points.points)

func _on_TextureButton_button_up():
	$TextureButton.texture_normal = errou
	$TextureButton.texture_pressed = errou
	$TextureButton.texture_hover = errou
	
	yield(get_tree().create_timer(1), 'timeout')
	get_tree().reload_current_scene()
	
func _on_TextureButton3_button_up():
	$TextureButton3.texture_normal = acertou
	$TextureButton3.texture_pressed = acertou
	$TextureButton3.texture_hover = acertou
	
	yield(get_tree().create_timer(1), 'timeout')
	if Points.pergunta33 == false:
		Points.addpoint()
		Points.addpoint()
		Points.pergunta33 = true
	
	get_tree().change_scene("res://scenes/fase 3/Perguntas/Pergunta_fase3_4.tscn")

func _on_TextureButton2_button_up():
	$TextureButton2.texture_normal = errou
	$TextureButton2.texture_pressed = errou
	$TextureButton2.texture_hover = errou
	
	yield(get_tree().create_timer(1), 'timeout')
	get_tree().reload_current_scene()
