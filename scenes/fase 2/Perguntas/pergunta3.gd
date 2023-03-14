extends Node2D


func _on_Resposta2_pressed():

	if Points.pergunta23 == false:
		Points.addpoint()
		
	Points.pergunta23 = true
	print(Points.points)
	get_tree().change_scene("res://scenes/fase 2/Perguntas/pergunta4.tscn")
