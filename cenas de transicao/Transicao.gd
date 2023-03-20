extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(transition_in):
#	self.visible = false
	queue_free()


func _on_AnimationPlayer_animation_started(anim_name):
#	self.visible = true
	pass
