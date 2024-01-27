extends State
class_name spawn
@onready var Orbita := $"../../EsferasF"
@export var RSpeed : float
const EFire = preload("res://Lista de escenas/Enemigos/FireTypeEnemy.tscn")
var Esferas = []
var time = 15
# Called when the node enters the scene tree for the first time.
func enter():
	for hijos in Orbita.get_children():
		Esferas.append(hijos)
	RondaSpaw()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func Physics_Update(delta):
	time -= delta
	if time <= 0:
		Trancision.emit(self, "Reposo")
	Orbita.rotation += RSpeed
	for i in Esferas:
		i.look_at(Orbita.global_position)
func PSpawn(): # Devuelve el vector2 con la posicion aleatoria
	var Posicion: Vector2
	Posicion.x = Orbita.global_position.x
	var ejey = randi_range(800, 1400)
	if randf_range(0,1) > 0.5:
		ejey *= -1
	Posicion.y = ejey + Orbita.global_position.y
	return Posicion
	
func Spaw(): # Instancia El enemigo
	var Enemigonew = EFire.instantiate()
	var padre = get_parent()
	#print(Enemigonew)
	add_child(Enemigonew)
	Enemigonew.global_position = PSpawn()

func RondaSpaw(): # auto descriptiva y son dos lineas no jodan 
	for i in range(0,6):
		Spaw()
