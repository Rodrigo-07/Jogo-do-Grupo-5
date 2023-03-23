extends KinematicBody2D

# Código para controlar o movimento do obstáculo
var move = Vector2()
var speed = 15

func _ready():
	set_position(Vector2(176,162))
	set_z_index(1)
	

func _physics_process(delta):
	# Movimento do obstáculo
	if position.y == 162:
		move.y = speed
	if position.y == 248:
		move.y = - speed
	move_and_slide(move)

	var collide = move_and_collide(move * delta)
	
	if collide:
		get_tree().change_scene("res://scenes/whg.tscn")
		if collide:
			var colisor = str(collide.collider.name)
			if colisor == "KinematicBody2D":
				get_tree().reload_current_scene()
