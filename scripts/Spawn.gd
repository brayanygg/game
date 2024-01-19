extends Node2D
@export var Player = CharacterBody2D

const RadioMin = 600
const RadioMax = 1200
const EFire = preload("res://Lista de escenas/Enemigos/FireTypeEnemy.tscn")
const Eagua = preload("res://Lista de escenas/Enemigos/ENemyAgua.tscn")
const Etierra = preload("res://Lista de escenas/Enemigos/RockTypeEnemy.tscn")
var Probabilidad = [Etierra,EFire,Eagua]
@export var TiempoInGame: int = 0
var ProAlta = 70
var ProMedia = 35
var ExSpawn = 3
func _ready():
	pass
func PSpawn(): # Devuelve el vector2 con la posicion
	var Posicion: Vector2
	var ejex = randi_range(RadioMin,RadioMax)
	var ejey = randi_range(RadioMin,RadioMax)
	if randf_range(0,1) > 0.5:
		ejex *= -1
	if randf_range(0,1) > 0.5:
		ejey *= -1
	Posicion.x = ejex + Player.global_position.x
	Posicion.y = ejey + Player.global_position.y
	return Posicion
	

func Spaw():
	var Enemigonew = DefinirTipo().instantiate()
	var padre = get_parent()
	print(Enemigonew)
	add_child(Enemigonew)
	Enemigonew.global_position = PSpawn()

func RondaSpaw():
	for i in range(0,ExSpawn):
		Spaw()
func DefinirTipo():
	var num = randf_range(0,1) * 100 
	if ProAlta < num:
		return Probabilidad[0]
	elif ProMedia < num:
		return Probabilidad[1]
	else:
		return Probabilidad[2]

func CambioOrden():
	Probabilidad.append(Probabilidad[0])
	Probabilidad.remove_at(0)
	TiempoInGame += 15
	if TiempoInGame == 60:
		ProAlta = 60
		ProMedia = 25
	elif TiempoInGame >= 60 and TiempoInGame < 105:
		ExSpawn += 1
	elif TiempoInGame == 180:
		ProAlta = 50
		ProMedia = 20
		ExSpawn += 2
		#$Timer.start(3)
	

