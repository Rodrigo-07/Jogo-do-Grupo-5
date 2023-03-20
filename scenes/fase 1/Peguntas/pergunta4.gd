extends Node2D

func _on_Resposta2_pressed():
	if Points.pergunta14 == false:
		Points.addpoint()
	Points.pergunta14 = true
	get_tree().change_scene("res://scenes/fase 1/Peguntas/pergunta4.tscn")
