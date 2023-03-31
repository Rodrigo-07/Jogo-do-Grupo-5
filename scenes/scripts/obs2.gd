extends KinematicBody2D

# Código para controlar o movimento do obstáculo
var move = Vector2()
var speed = 15

func _ready():
	# Posição inicial
	set_position(Vector2(143, 107))
	set_z_index(1)
	
func _physics_process(delta):
	# Movimento de patrula do obstáculo
	if position.x == 153:
		move.x = - speed
	if position.x == 143:
		move.x = speed
	if position.y == 107:
		move.y = speed
	if position.y == 183:
		move.y = -speed

	move_and_slide(move)

	var collide = move_and_collide(move * delta)
	
	# Colisão do obstáculo apenas com o player
	if collide:
		get_tree().change_scene("res://scenes/whg.tscn")
		if collide:
			var colisor = str(collide.collider.name)
			if colisor == "KinematicBody2D":
				get_tree().reload_current_scene()
