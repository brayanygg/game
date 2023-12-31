extends State
class_name EnemyWander
@export var enemy: CharacterBody2D
@export var speed : int = 100
var dir : Vector2
var wander_time : float
var player :CharacterBody2D

	
func enter():
	player = get_tree().get_first_node_in_group("player")
	randomize_wander()
	
func randomize_wander():
	dir = Vector2(randf_range(-1,1), randf_range(-1,1)).normalized()
	wander_time = randf_range(1,4)

func Update(delta:float):
	
	if wander_time	> 0:
		wander_time -= delta
	else:
		randomize_wander()
		
func Physics_Update(_delta):
	var dir = player.global_position - enemy.global_position
	if dir.length() > 1250:
		Trancision.emit(self, "follow")
		return
	if enemy:
		enemy.velocity = dir.normalized() * speed
