#Script: Enemy Clever 
extends "res://Scripts/Enemy.gd"
const scn_Laser = preload("res://Scenes/Laser_Enemy.tscn")

func _ready():
	velocity.x = Utils.choose([+velocity.x, -velocity.x])
	yield(Utils.create_timer(1), "timeout")
	Shoot()
	pass
	
func _process(_delta):
	#Bouncing on the Edges.
	if self.position.x <= 0+16:
		velocity.x = abs(velocity.x)
	if self.position.x >= Utils.view_size.x-16:
		velocity.x = -abs(velocity.x)
	pass
	
func Shoot():
	while true:
		var Laser = scn_Laser.instance()
		Laser.set_position(get_node("Canon").get_global_mouse_position())
		Utils.main_node.add_child(Laser)
		
		yield(get_tree().create_timer(1.5), "timeout")
	pass

	  

