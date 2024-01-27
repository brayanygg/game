extends State
class_name Reposo
@onready var Orbita := $"../../EsferasF"
@export var RSpeed : float
var Esferas = []
var time = 15
# Called when the node enters the scene tree for the first time.
func enter():
	for hijos in Orbita.get_children():
		Esferas.append(hijos)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func Physics_Update(delta):
	time -= delta
	if time <= 0:
		if randf_range(0,1) <= 0.50:
			Trancision.emit(self, "spawn")
		else:
			Trancision.emit(self, "Atack")			
	Orbita.rotation += RSpeed
	for i in Esferas:
		i.look_at(Orbita.global_position)

	
