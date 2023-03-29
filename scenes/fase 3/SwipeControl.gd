extends TouchScreenButton
class_name SwipeScreenButton

var on_area := false
var down = false
var up = false
var right = false
var left = false
# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect('pressed', self, '_on_self_pressed')
	self.connect('released', self, '_on_self_released')
func _get_swipe_direction(swipe, swipe_margin):
	var swipe_direction := Vector2.ZERO
	
	if swipe.x >= -swipe_margin and swipe.x <= swipe_margin and swipe.y >= swipe_margin:
		swipe_direction = Vector2.DOWN
		down = true
		print("ddsddssdd")
	if swipe.x >= -swipe_margin and swipe.x <= swipe_margin and swipe.y <= -swipe_margin:
		swipe_direction = Vector2.UP
		up = true
	if swipe.y >= -swipe_margin and swipe.y <= swipe_margin and swipe.x >= swipe_margin:
		swipe_direction = Vector2.RIGHT
		right = true
	if swipe.y >= -swipe_margin and swipe.y <= swipe_margin and swipe.x <= -swipe_margin:
		swipe_direction = Vector2.LEFT
		left = true
	if on_area == true:
		return swipe_direction 

func _process(delta):
	pass
	
func _on_self_pressed():
	on_area = true
	print("hbhhhh")
	down = true
func _on_self_released():
	on_area = false

func _on_SwipeScreenButton_pressed():
	on_area = true

func _on_SwipeScreenButton_released():
	on_area = false
