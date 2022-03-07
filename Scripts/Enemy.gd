#Script: Enemy

extends Area2D

export var armor = 2 setget set_armor
export var Score_Value = 5
export var velocity = Vector2()



func _ready():
	set_process(true)
	pass
	
func _process(_delta):
	translate(velocity * _delta)
	
	if get_position().y-16 >= get_viewport_rect().size.length():
		queue_free()
	
	pass
	
func set_armor(new_value):
	armor = new_value
	if armor <=0: queue_free()
	
	pass
