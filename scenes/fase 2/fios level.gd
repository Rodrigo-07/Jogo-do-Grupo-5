extends Node2D

var selected = false

# Variáveis de verificação dos fios conectados
var red_wire = false
var green_wire = false
var blue_wire = false
var orange_wire = false

# Variáveis que validam se a conexão foi feita certa
var red_connected = false
var green_connected = false
var blue_connected = false
var orange_connected = false

var vidas = 0

var touch_position 

# Váriaveis das linhas dos fios
onready var line := $Red_line
onready var line2 := $Green_line
onready var current_line := $Red_line

func _ready():
	current_line.points[0] = Vector2(-10, 0)

func _process(delta):
	touch_position = get_viewport().get_mouse_position()
	
	if selected:
		current_line.points[1] = Vector2(touch_position.x-current_line.position.x,touch_position.y-current_line.position.y)
	
	if red_connected and blue_connected and orange_connected and green_connected:
		$AnimatedSprite.stop()
		$AnimatedSprite.play("win")
		yield(get_tree().create_timer(3), 'timeout')
		if Points.fios == false:
			Points.addpoint()
			Points.fios = true
		get_tree().change_scene("res://scenes/fase 2/Dialogos fase 2/dialogo_fase2_4.tscn")
	
	if vidas >= 1:
		$AnimatedSprite.play("oneError")
	if vidas >= 2:
		$AnimatedSprite.play("twoError")
	if vidas >= 3:
		$AnimatedSprite.play("threeError")
		get_tree().reload_current_scene()



# FUNÇÕES DE SELEÇÃO DO FIO

func _on_Red_selection_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		selected = true
		red_wire = true
		current_line = $Red_line
		current_line.visible = true
		print(current_line)

func _on_Green_selection_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
			selected = true
			green_wire = true
			current_line = $Green_line
			current_line.visible = true

func _on_Blue_selection_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
			selected = true
			blue_wire = true
			current_line = $Blue_line
			current_line.visible = true

func _on_Orange_selection_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
			selected = true
			orange_wire = true
			current_line = $Orange_line
			current_line.visible = true

# FUNÇÕES DOS TERMINAIS

#func _on_Green_terminal_input_event(viewport, event, shape_idx):
#	if Input.is_mouse_button_pressed(BUTTON_LEFT) and green_wire == true:
#		selected = false
#		current_line.points[1] = Vector2(390, 208)
#		$Green_selection/CollisionShape2D.set_deferred("disabled", true)
#		green_connected = true
#		print(vidas)
#	elif Input.is_mouse_button_pressed(BUTTON_LEFT) and green_wire == false:
#		vidas += 1
#		selected = false
#		current_line.points[1] = current_line.points[0]
#		current_line.visible = false
#		print(vidas)


#func _on_Red_terminal_input_event(viewport, event, shape_idx):
#	if Input.is_mouse_button_pressed(BUTTON_LEFT) and red_wire == true:
#		selected = false
#		current_line.points[1] = Vector2(265, -190)
#		$Red_selection/CollisionShape2D.set_deferred("disabled", true)
#		red_connected = true
#	elif Input.is_mouse_button_pressed(BUTTON_LEFT) and red_wire == false:
#		vidas += 1
#		selected = false
#		current_line.points[1] = current_line.points[0]
#		current_line.visible = false
#		print(vidas)

#func _on_Blue_terminal_input_event(viewport, event, shape_idx):
#	if Input.is_mouse_button_pressed(BUTTON_LEFT) and blue_wire == true:
#		selected = false
#		current_line.points[1] = Vector2(290, 137)
#		$Blue_selection/CollisionShape2D.set_deferred("disabled", true)
#		blue_connected = true
#	elif Input.is_mouse_button_pressed(BUTTON_LEFT) and blue_wire == false:
#		vidas += 1
#		selected = false
#		current_line.points[1] = current_line.points[0]
#		current_line.visible = false
#		print(vidas)

#func _on_Orange_terminal_input_event(viewport, event, shape_idx):
#	if Input.is_mouse_button_pressed(BUTTON_LEFT) and orange_wire == true:
#		selected = false
#		current_line.points[1] = Vector2(300, -165)
#		$Orange_selection/CollisionShape2D.set_deferred("disabled", true)
#		orange_connected = true
#	elif Input.is_mouse_button_pressed(BUTTON_LEFT) and orange_wire == false:
#		vidas += 1
#		selected = false
#		current_line.points[1] = Vector2(0,0)
#		current_line.visible = false
#		print(vidas)

func _on_Orange_terminal_mouse_entered():
	if selected == true and orange_wire == true:
		selected = false
		current_line.points[1] = Vector2(300, -165)
		$Orange_selection/CollisionShape2D.set_deferred("disabled", true)
		orange_connected = true
	elif selected == true and orange_wire == false:
		vidas += 1
		selected = false
		current_line.points[1] = current_line.points[0]
		current_line.visible = false
		print(vidas)

#func _on_Gray_terminal_input_event(viewport, event, shape_idx):
#	if Input.is_mouse_button_pressed(BUTTON_LEFT):
#		vidas += 1
#		selected = false
#		current_line.points[1] = current_line.points[0]
#		print(vidas)


func _on_Blue_terminal_mouse_entered():
	if selected == true and blue_wire == true:
		selected = false
		current_line.points[1] = Vector2(290, 137)
		$Blue_selection/CollisionShape2D.set_deferred("disabled", true)
		blue_connected = true
	elif selected == true and blue_wire == false:
		vidas += 1
		selected = false
		current_line.points[1] = current_line.points[0]
		current_line.visible = false
		print(vidas)


func _on_Green_terminal_mouse_entered():
	if selected == true and green_wire == true:
		selected = false
		current_line.points[1] = Vector2(390, 208)
		$Green_selection/CollisionShape2D.set_deferred("disabled", true)
		green_connected = true
		print(vidas)
	elif selected == true and green_wire == false:
		vidas += 1
		selected = false
		current_line.points[1] = current_line.points[0]
		current_line.visible = false
		print(vidas)


func _on_Red_terminal_mouse_entered():
	if selected == true and red_wire == true:
		selected = false
		current_line.points[1] = Vector2(265, -190)
		$Red_selection/CollisionShape2D.set_deferred("disabled", true)
		red_connected = true
	elif selected == true and red_wire == false:
		vidas += 1
		selected = false
		current_line.points[1] = current_line.points[0]
		current_line.visible = false
		print(vidas)


func _on_Gray_terminal_mouse_entered():
	if selected == true:
		vidas += 1
		selected = false
		current_line.points[1] = current_line.points[0]
		print(vidas)
