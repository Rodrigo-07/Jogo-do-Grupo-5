extends Node2D

func _ready():
	pass


func _on_Pausar_pressed():
	get_tree().paused = true
	$FundoPause.show()


func _on_Button2_pressed():
	get_tree().paused = false
	$FundoPause.hide()
