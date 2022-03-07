#Script: Flare

extends Sprite

func _ready():
	get_node("AnimationPlayer").play("Fade_Out")
	yield(get_node("AnimationPlayer"), "animation_finished")
	queue_free()
	pass 
