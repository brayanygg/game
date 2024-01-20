extends CharacterBody2D
class_name enemy
const Name = "Enemy"
@export_category("Aspecto")
@export_category("Stats General")
@export var HP: float = 300.0
@export_enum("fuego", "agua", "tierra") var Elemento: String
@onready var BarraVida := $AspectRatioContainer/ProgressBar
# Cuadra el Tiangulo de debilidades
const TrianguloD = {"fuego": "agua",
					"agua": "tierra",
					"tierra": "fuego"}
var Debilidad
var Etype
func _ready():
	Etype = Elemento
	Debilidad = TrianguloD.get(Etype) #obtiene la debilidad de este enemigo segun su tipo
	$AnimatedSprite2D.play("caminar")
	
	
func _physics_process(_delta):
	if velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
	#$ProgressBar.value += 1
	move_and_slide()


func _on_area_2d_body_entered(body): 
	"""Funcion temporal para que se elimin cuando se acerquen al player 
	para no tener sobrepoblacion (ni que fueramos pais asiatico), aqui pueden poner
	lo de restar Score, poder, power, como le pongan al player"""
	if body is TileMap:
		return
	if body.Name == "Player": 
		queue_free()
