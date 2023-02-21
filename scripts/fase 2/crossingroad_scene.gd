extends Node2D

# Carrega a cena que está o carro
var car_scene = preload("res://scenes/fase 2/carro.tscn")
var car

var car_scene_2 = preload("res://scenes/fase 2/carro2.tscn")
var car2

var car_scene_3 = preload("res://scenes/fase 2/carro3.tscn")
var car3

var car_scene_4 = preload("res://scenes/fase 2/carro4.tscn")
var car4

var car_scene_5 = preload("res://scenes/fase 2/carro5.tscn")
var car5

var timer_limit = 1000

var random1 = 1
var random2 = 1
var random3 = 2
var random4 = 2
var random5 = 2

# Create a timer node
var timer = Timer.new()

func _ready():
	# Set it as repeat
	timer.set_one_shot(false)

	# Connect its timeout signal to the function you want to repeat
	timer.connect("timeout", self, "car_spaw_1")
	timer.connect("timeout", self, "car_spaw_2")
	timer.connect("timeout", self, "car_spaw_3")
	timer.connect("timeout", self, "car_spaw_4")
	timer.connect("timeout", self, "car_spaw_5")
	
	# Add to the tree as child of the current node
	add_child(timer)

	timer.start()

# Faz a instancia da cena do carro nessa cena
func car_spaw_1():
	car = car_scene.instance()
	add_child(car)
	
	random1 = rand_range(1, 3)
	
	# Set timer interval
	timer.set_wait_time(random1)

func car_spaw_2():
	car2 = car_scene_3.instance()
	add_child(car3)
	
	random2 = rand_range(1, 3)
	
	# Set timer interval
	timer.set_wait_time(random2)

func car_spaw_3():
	car3 = car_scene_2.instance()
	add_child(car2)
	
	random3 = rand_range(1, 3)
	
	# Set timer interval
	timer.set_wait_time(random3)
	
func car_spaw_4():
	car4 = car_scene_4.instance()
	add_child(car4)
	
	random4 = rand_range(1, 3)
	
	# Set timer interval
	timer.set_wait_time(random4)

func car_spaw_5():
	car5 = car_scene_5.instance()
	add_child(car5)
	
	random5 = rand_range(5, 7)
	
	# Set timer interval
	timer.set_wait_time(random5)
