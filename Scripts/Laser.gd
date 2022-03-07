#Script: LAser

extends Area2D

export var velocity = Vector2()
const scn_Flare = preload("res://Scenes/Flare.tscn")


func _ready():
	set_process(true)
	create_Flare()
	
	yield(get_node("Vis_Notifier"), "screen_exited")
	queue_free()
	pass 
	
func _process(delta):
	translate(velocity * delta)
	pass
	
	
func create_Flare():
	var Flare = scn_Flare.instance()
	Flare.set_position(get_position())

