#Script Ship

extends Area2D
var armor = 4 setget set_armor

const scn_Laser = preload("res://Scenes/Laser_Ship.tscn")

func _ready():
	set_process(true)
	add_to_group("Ship")
	
	yield(Utils.create_timer(0.5), "timeout")
	
	Shoot()
	pass

func _process(_delta):
	#tracking Mouse
	var motion = (get_global_mouse_position().x - get_position().x) * 0.2
	translate(Vector2(motion, 0))
	
	#Clamping to view
	var view_size = get_viewport_rect().size
	var position = get_position() 
	position.x   = clamp(position.x, 0+16,Utils.view_size.length()-16)
	set_position(position)
	pass 
	
func Shoot():
	while true:
		var position_Left = get_node("Canon/Left").get_global_position()
		var position_Right = get_node("Canon/Right").get_global_position()
		create_Laser(position_Left)
		create_Laser(position_Right)
		
		yield(Utils.create_timer(0.25), "timeout")
	pass
	
	
func set_armor(new_value):
	armor = new_value
	if armor <= 0: queue_free()
	pass
	
func create_Laser(position):
	var Laser = scn_Laser.instance()
	Laser.set_position(position)
	Utils.main_node.add_child(Laser)
	

