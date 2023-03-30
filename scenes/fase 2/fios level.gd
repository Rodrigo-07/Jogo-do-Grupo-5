extends Node2D

var selected = false

# Variáveis de verificação dos fios conectados
var red_wire = false
var green_wire = false
var blue_wire = false
var orange_wire = false

var vidas = 0

var touch_position 

# Váriaveis das linhas dos fios
onready var line := $Red_line
onready var line2 := $Green_line
onready var current_line := $Red_line

func _ready():
	current_line.points[0] = Vector2()

func _process(delta):
	touch_position = get_viewport().get_mouse_position()
	
	if selected:
		current_line.points[1] = Vector2(touch_position.x-current_line.position.x,touch_position.y-current_line.position.y)
		print(current_line.points[1])
	
	if vidas >= 2:
		$AnimatedSprite.play("oneError")
	if vidas >= 4:
		$AnimatedSprite.play("twoError")
	if vidas >= 6:
		$AnimatedSprite.play("threeError")


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
	if Input.is_action_just_pressed("click"):
			selected = true
			blue_wire = true
			current_line = $Blue_line
			current_line.visible = true

func _on_Orange_selection_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
			selected = true
			orange_wire = true
			current_line = $Orange_line
			current_line.visible = true

# FUNÇÕES DOS TERMINAIS

func _on_Green_terminal_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and green_wire == true:
		selected = false
		current_line.points[1] = Vector2(330, 251)
		print(vidas)
	elif Input.is_mouse_button_pressed(BUTTON_LEFT) and green_wire == false:
		vidas += 1
		selected = false
		current_line.points[1] = Vector2(72,123)
		current_line.visible = false
		print(vidas)


func _on_Red_terminal_input_event(viewport, event, shape_idx):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and red_wire == true:
		selected = false
		current_line.points[1] = Vector2(265, -190)
	elif Input.is_mouse_button_pressed(BUTTON_LEFT) and red_wire == false:
		vidas += 1
		selected = false
		current_line.points[1] = Vector2(0,0)
		current_line.visible = false
		print(vidas)

func _on_Blue_terminal_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click") and blue_wire == true:
		selected = false
		current_line.points[1] = Vector2(279, 137)
	elif Input.is_action_just_pressed("click") and blue_wire == false:
		vidas += 1
		selected = false
		current_line.visible = false
		print(vidas)

func _on_Orange_terminal_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click") and orange_wire == true:
		selected = false
		current_line.points[1] = Vector2(270, -165)
	elif Input.is_action_just_pressed("click") and orange_wire == false:
		vidas += 1
		selected = false
		current_line.points[1] = Vector2(0,0)
		current_line.visible = false
		print(vidas)


func _on_TouchScreenButton_pressed():
	pass # Replace with function body.
