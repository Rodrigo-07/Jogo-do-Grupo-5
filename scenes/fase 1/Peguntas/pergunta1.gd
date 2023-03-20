extends Node2D

func _on_Resposta3_pressed():
	get_tree().change_scene("res://Dialogos/Dialogo1_2.tscn")
	if Points.pergunta11 == false:
		Points.addpoint()
		Points.addpoint()
	Points.pergunta11 = true
