extends Node2D
var actual
var lista = []
const dir = {"caminar":"caminar1",}
@onready var anim := $AnimatedSprite2D
func _ready():
	lista.append(dir)
func _process(delta):
	if actual:
		anim.play(actual.get("caminar"))


func _on_timer_timeout():
	print(lista)
	actual = lista[0]
	lista.append(lista[0])
	lista.remove_at(0)

