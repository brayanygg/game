extends State
class_name Follow
@export var enemy: CharacterBody2D
@export var speed : int = 100
var dir : Vector2
var player : CharacterBody2D
var InRango = true
func enter():
	player = get_tree().get_first_node_in_group("player")
func Physics_Update(delta):
	var dir = player.global_position - enemy.global_position
	if dir.length() < 300 and player.Etype == enemy.Debilidad:
		Trancision.emit(self, "escape")
		return
	if dir.length() > 100:
		enemy.velocity = dir.normalized() * speed
	else:
		enemy.velocity = Vector2()

func Update(_delta: float):
	pass
	
func State_physics_Update(_delta: float):
	pass
