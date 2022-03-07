# script: ship

extends Area2D

func _ready():
	set_process(true)
	pass

func _process(delta):
	# tracking mouse
	var motion = (get_global_mouse_pos().x - get_pos().x) * 0.2
	translate(Vector2(motion, 0))
	
	# clamping to view
	var view_size = get_viewport_rect().size
	var pos = get_pos()
	pos.x   = clamp(pos.x, 0+16, view_size.width-16)
	set_pos(pos)
	pass

