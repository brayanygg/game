extends CharacterBody2D
class_name EsferaF

@export var speed: int = 100
var Dirigido = false
var Volver = false
var positionI
func _ready():
	positionI = global_position
func _physics_process(delta):
	if Dirigido:
		position  = transform.x * speed * delta
	elif Volver:
		if global_position != positionI:
			position  = transform.x * speed * delta
func Impacto(body):
	#aplicar la logica del impacto con la bola
	pass
		
