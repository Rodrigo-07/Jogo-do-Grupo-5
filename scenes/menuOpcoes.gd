extends Node2D

var stop = get_node(".").visible

func _ready():
	set_z_index(2)
	print("si")
	stop = true
	
func _on_Button_pressed():
	stop = false
