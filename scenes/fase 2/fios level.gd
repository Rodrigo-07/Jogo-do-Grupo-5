extends Node2D

var selected = false

# Variáveis de verificação dos fios conectados
var red_wire = false
var green_wire = false
var blue_wire = false
var orange_wire = false

var vidas = 3

var mouse

# Váriaveis das linhas dos fios
onready var line := $Red_line
onready var line2 := $Green_line
onready var current_line := $Red_line

func _ready():
	current_line.points[0] = Vector2()

func _process(delta):
#	if selected == true:
#		current_line.points[1] = get_global_mouse_position() - Vector2(30,50)
		
#		current_line.set_point_position(1, get_global_mouse_position())
#		current_line.add_point(get_global_mouse_position())
#	print(current_line)
#	elif selected_green:
#		line2.points[1] = get_global_mouse_position()
	mouse = get_viewport().get_mouse_position()
	
	if selected:
		current_line.points[1] = Vector2(mouse.x-current_line.position.x,mouse.y-current_line.position.y)
	
	print("Linha", current_line.get_point_position (1))
	print(get_global_mouse_position())
	print(get_local_mouse_position())

# Funções de seleção do fio

func _on_Red_selection_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true
		red_wire = true
		current_line = $Red_line
		print(current_line)

func _on_Green_selection_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
			selected = true
			green_wire = true
			current_line = $Green_line

# Funções dos terminais

func _on_Green_terminal_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click") and green_wire == true:
		selected = false
		current_line.points[1] = Vector2(254, 220)
		print(vidas)
	elif Input.is_action_just_pressed("click") and green_wire == false:
		vidas -= 1
		selected = false
		current_line.points[1] = Vector2(0,0)
		print(vidas)


func _on_Red_terminal_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click") and red_wire == true:
		selected = false
		current_line.points[1] = Vector2(310, 301)
	elif Input.is_action_just_pressed("click") and red_wire == false:
		vidas -= 1
		selected = false
		current_line.points[1] = Vector2(0,0)
		print(vidas)


func _on_Blue_selection_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
			selected = true
			blue_wire = true
			current_line = $Blue_line


func _on_Blue_terminal_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click") and blue_wire == true:
		selected = false
		current_line.points[1] = Vector2(310, 301)
	elif Input.is_action_just_pressed("click") and blue_wire == false:
		vidas -= 1
		selected = false
		current_line.points[1] = Vector2(0,0)
		print(vidas)


func _on_Orange_selection_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
			selected = true
			orange_wire = true
			current_line = $Orange_line


func _on_Orange_terminal_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click") and orange_wire == true:
		selected = false
		current_line.points[1] = Vector2(310, 301)
	elif Input.is_action_just_pressed("click") and orange_wire == false:
		vidas -= 1
		selected = false
		current_line.points[1] = Vector2(0,0)
		print(vidas)
