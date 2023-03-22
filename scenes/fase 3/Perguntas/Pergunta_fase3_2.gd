extends Node2D

var errou = load("res://sprites/Buttonvermelho.png")
var acertou = load("res://sprites/Buttonverde.png")

func _ready():
	$Points.text = str(Points.points)

func _on_TextureButton3_button_up():
	$TextureButton3.texture_normal = errou
	$TextureButton3.texture_pressed = errou
	$TextureButton3.texture_hover = errou
	
	yield(get_tree().create_timer(5), 'timeout')
	get_tree().reload_current_scene()
	
func _on_TextureButton_button_up():
	$TextureButton.texture_normal = acertou
	$TextureButton.texture_pressed = acertou
	$TextureButton.texture_hover = acertou
	Points.points +=1
	
	yield(get_tree().create_timer(1), 'timeout')
	if Points.pergunta32 == false:
		Points.addpoint()
		Points.addpoint()
		Points.pergunta32 = true
	get_tree().change_scene("res://scenes/fase 3/Dialogos/dialogo_fase3_2.tscn")

func _on_TextureButton2_button_up():
	$TextureButton2.texture_normal = errou
	$TextureButton2.texture_pressed = errou
	$TextureButton2.texture_hover = errou
	
	yield(get_tree().create_timer(5), 'timeout')
	get_tree().reload_current_scene()
