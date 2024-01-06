extends State
class_name Escape
@export var enemy: CharacterBody2D
@export var speed : int = 300
var dir : Vector2
var player : CharacterBody2D
func enter():
	player = get_tree().get_first_node_in_group("player")
	
func Physics_Update(delta):
	var dir = player.global_position - enemy.global_position
	if enemy.Debilidad != player.Etype:
		Trancision.emit(self, "follow")
		return
	if dir.length() > 1000:
		Trancision.emit(self, "wander")
		return
	if dir.length() > 250:
		dir *= -1
		enemy.velocity = dir.normalized() * speed
	else:
		enemy.velocity = Vector2()

