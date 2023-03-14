extends Node2D


func _on_Resposta3_pressed():
	if Points.pergunta21 == false:
		Points.addpoint()
	Points.pergunta21 = true
	print(Points.points)
	get_tree().change_scene("res://scenes/fase 2/Perguntas/pergunta2.tscn")
