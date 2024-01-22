extends Node2D
@export var Player = CharacterBody2D

const RadioMin = 600
const RadioMax = 1600
#Cargar las escenas de enemigos
const EFire = preload("res://Lista de escenas/Enemigos/FireTypeEnemy.tscn")
const Eagua = preload("res://Lista de escenas/Enemigos/ENemyAgua.tscn")
const Etierra = preload("res://Lista de escenas/Enemigos/RockTypeEnemy.tscn")
#lista para determinar el orden de probabilidad del spawn
var Probabilidad = [Etierra,EFire,Eagua]
#variable ahi para poder acer pruebas en la parte del tiempo que queramos sin tener
@export var TiempoInGame: int = 0 # que pasar medai ora con el juego abierto
var ProAlta = 65 # Define la probailidad mayorInicial (35%)
var ProMedia = 30 # lo mismo pero con la media (35%)
# la ultima pues el porcentaje que falta eche cuentas
var ExSpawn = 3
func _ready():
	pass

func PSpawn(): # Devuelve el vector2 con la posicion aleatoria
	var Posicion: Vector2
	var ejex = randi_range(0,RadioMax)
	var ejey = randi_range(0,RadioMax)
	if ejex < RadioMin and RadioMin > ejey:
		if ejex < ejey:
			ejex += RadioMin
		else:
			ejey += RadioMin 
	if randf_range(0,1) > 0.5:
		ejex *= -1
	if randf_range(0,1) > 0.5:
		ejey *= -1
	Posicion.x = ejex + Player.global_position.x
	Posicion.y = ejey + Player.global_position.y
	return Posicion
	
func Spaw(): # Instancia El enemigo
	var Enemigonew = DefinirTipo().instantiate()
	var padre = get_parent()
	#print(Enemigonew)
	add_child(Enemigonew)
	Enemigonew.global_position = PSpawn()

func RondaSpaw(): # auto descriptiva y son dos lineas no jodan 
	for i in range(0,ExSpawn):
		Spaw()

func DefinirTipo(): # no pregunten como pero esto usa las probabilidades y funciona
	var num = randf_range(0,1) * 100 
	if ProAlta < num:
		return Probabilidad[0]
	elif ProMedia < num:
		return Probabilidad[1]
	else:
		return Probabilidad[2]

func CambioOrden():# cambia las probabilidad para cada tipo
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
	

