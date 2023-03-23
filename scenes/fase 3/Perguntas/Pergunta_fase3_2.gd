extends Node2D

var errou = load("res://sprites/Buttonvermelho.png")
var acertou = load("res://sprites/Buttonverde.png")

func _process(delta):
	$Points.text = str(Points.points) + " V Coins"
	

func _on_TextureButton3_button_up():
	$TextureButton3.texture_normal = errou
	$TextureButton3.texture_pressed = errou
	$TextureButton3.texture_hover = errou
	
	yield(get_tree().create_timer(0.5), 'timeout')
	$FeedbackErro2/Popup.show()
	
func _on_TextureButton_button_up():
	$TextureButton.texture_normal = acertou
	$TextureButton.texture_pressed = acertou
	$TextureButton.texture_hover = acertou
	
	if Points.pergunta32 == false:
		Points.addpoint()
		Points.addpoint()
		Points.pergunta32 = true
	
	yield(get_tree().create_timer(0.5), 'timeout')
	$FeedbackAcerto2/Popup.show()


func _on_TextureButton2_button_up():
	$TextureButton2.texture_normal = errou
	$TextureButton2.texture_pressed = errou
	$TextureButton2.texture_hover = errou
	
	yield(get_tree().create_timer(0.5), 'timeout')
	$FeedbackErro2/Popup.show()

