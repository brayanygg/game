extends Node2D
@export var Player = CharacterBody2D

const RadioMin = 600
const RadioMax = 1200
const EFire = preload("res://Lista de escenas/Enemigos/FireTypeEnemy.tscn")
const Eagua = preload("res://Lista de escenas/Enemigos/ENemyAgua.tscn")
const Etierra = preload("res://Lista de escenas/Enemigos/RockTypeEnemy.tscn")
var Probabilidad = [Etierra,EFire,Eagua]
func _ready():
	
	var Enemigooo = EFire.instantiate()
	var padre = get_parent()
	add_child(Enemigooo)
	Enemigooo.global_position = PSpawn()
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
	add_child(Enemigonew)
	Enemigonew.global_position = PSpawn()

func RondaSpaw():
	for i in range(0,3):
		Spaw()
func DefinirTipo():
	var num = randf_range(0,1) * 100 
	if 60 < num:
		return Probabilidad[0]
	elif 20 < num:
		return Probabilidad[1]
	else:
		return Probabilidad[2]

func CambioOrden():
	Probabilidad.append(Probabilidad[0])
	Probabilidad.remove_at(0)
	


