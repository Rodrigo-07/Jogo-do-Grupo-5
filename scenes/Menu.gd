extends Node2D

func _ready():
	$AudioStreamPlayer2D.play(true)
		
func _on_start_pressed():
	get_tree().change_scene("res://scenes/conversa 1.tscn")
