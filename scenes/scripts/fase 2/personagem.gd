extends KinematicBody2D
var down = false
var up = false
var right = false
var left = false

# Funções e variáveis para fazer o movimento do player no celular
func _on_buttonUp_pressed():
	up = true
func _on_buttonUp_released():
	up = false
	

# Velocidade de movimento do personagem
var speed = 4000
# Define o movimento em 2 eixos
var move = Vector2()

# Inicia a fsica do jogo
func _physics_process(delta):
	
	# Controles do personagem
	if Input.is_action_pressed("ui_right") or right:
		move.x += speed * delta * 3.7
		$AnimationPlayer.play("andar para direita") 
	elif Input.is_action_just_pressed("ui_left") or left: 
		move.x = -speed * delta * 3.7
		$AnimationPlayer.play("andar para esquerda")
	elif Input.is_action_just_pressed("ui_up") or up: 
		move.y = -speed  * delta * 3.7
		$AnimationPlayer.play("andar para frente")
	elif Input.is_action_just_pressed("ui_down") or down:
		move.y = speed  * delta * 3.7
		$AnimationPlayer.play("andar para trás")
	else:
		move.x = 0
		move.y = 0
		$AnimationPlayer.stop()
		
	
	
	# Detecta colisões do personagem
#	move_and_slide(move)
	var collision = move_and_collide(move  * delta)
	
	# Se houver uma colisão a cena reinicia
	if collision:
		if collision.collider.name != "Barreira":
			get_tree().reload_current_scene()
			print(collision.collider.name)

# Se o objeto toca a casa ele vence a fase 
func _on_casa_body_entered(body):
	
	if Points.crossingroad == false:
		Points.addpoint()
		Points.crossingroad = true
	get_tree().change_scene("res://scenes/fase 2/Perguntas/pergunta4.tscn")



