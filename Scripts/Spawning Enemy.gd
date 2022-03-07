
# script: spawner_enemy


extends Node


const enemies = [
	preload("res://scenes/enemy_kamikaze.tscn"),
	preload("res://Scenes/Enemy_Clever.tscn")
	]



func _ready():
 spawn()
 pass


func spawn():
 while true:
  randomize()
  var enemy = Utils.choose(enemies).instance()
  var pos = Vector2()
  pos.x = rand_range(0+16, get_viewport().get_visible_rect().size.x-16)
  pos.y = 0-16
  enemy.set_position(pos)
  get_node("Container").add_child(enemy)
  yield(get_tree().create_timer(rand_range(0.5, 1.25)), "timeout") 
 pass
