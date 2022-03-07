extends "res://Scripts/Laser.gd"



func _ready():
	connect("area_entered", self, "on_area_enter")
	pass 
	
func _on_area_enter(other):
	if other.is_in_group("Enemy"):
		other.armor -=1
		create_Flare()
		queue_free()
	
	pass


