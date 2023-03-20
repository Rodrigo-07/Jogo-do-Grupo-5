extends Node2D



func _on_Resposta2_pressed():
	get_tree().change_scene("res://Dialogos/Dialogo1_3.tscn")
	if Points.pergunta12 == false:
		Points.addpoint()
	Points.pergunta12 = true
