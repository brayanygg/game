extends State
class_name Follow
@export var enemy: CharacterBody2D
@export var speed : int = 100
var dir : Vector2
var player: CharacterBody2D
var InRango = true
func _ready():
	pass
func enter():
	player = get_tree().get_first_node_in_group("player")
func Physics_Update(_delta):
	dir = player.global_position - enemy.global_position
	if player.Etype == enemy.Debilidad:
		Trancision.emit(self, "escape")
		return
	enemy.velocity = dir.normalized() * speed

