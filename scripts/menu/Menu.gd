extends Node2D

onready var transition = get_node("CanvasLayer/fill")
onready var animation = get_node("CanvasLayer/fill/AnimationPlayer")

export (int, "Pixels", "Spot Player", "Spot Centro", "Corte Vertical", "Corte Horizontal") var transition_type
export (float, 2.0) var duration = 1.0

# Começa a música do jogo
func _ready():
	transition.material.set_shader_param("type", transition_type)
	animation.playback_speed = duration
	$AudioStreamPlayer2D.play(true)
	Points.currentSaveCode()

# Botão de start para começar o jogo
func _on_TextureButton_pressed():
	get_tree().change_scene("res://Dialogos/dialogo_inicial.tscn")

# Botão de ajustes
func _on_TextureButton3_pressed():
#	$CanvasLayer.layer = 1
#	animation.play("transition_out")
	get_tree().change_scene("res://scenes/menu/Ajustes.tscn")


func _on_TextureButton4_pressed():
	get_tree().change_scene("res://Pontuação/checkPoints.tscn")
	
