extends State
class_name atack

@onready var Orbita := $"../../EsferasF"
var EsferaA
var EsferaB
var player: CharacterBody2D
# Called when the node enters the scene tree for the first time.
func enter():
	player = get_tree().get_first_node_in_group("player")
	var Esferas = []
	for hijos in Orbita.get_children():
		Esferas.append(hijos)
	EsferaA = Esferas[0]
	EsferaB = Esferas[1]
	TargetPlayer()
	
	

func Update(_delta):
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func Physics_Update(_delta):
	pass
func TargetPlayer():
	var posicion = player.global_position
	if !EsferaA.Dirigido and !EsferaA.Volver:
		EsferaA.Dirigido = true
		EsferaA.look_at(posicion)
	elif !EsferaB.Dirigido and !EsferaB.Volver:
		EsferaB.Dirigido = true
		EsferaB.look_at(posicion)
	
