extends Node2D

func _on_Resposta2_pressed():
	get_tree().change_scene("res://scenes/menu/main_interface.tscn")
	Points.addpoint()
