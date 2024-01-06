extends CharacterBody2D
class_name enemy

#ignorar simples pruebas
@export_category("Stats General")
@export_enum("Slow:150", "Average:200", "Very Fast:600") var speed: int
@export var HP: float = 300.0
@export var range: int = 25
@export_color_no_alpha var Flitro: Color
@export_enum("fuego", "agua", "tierra") var Etype: String
@onready var sprite := $Imagen
const TrianguloD = {"fuego": "agua",
					"agua": "tierra",
					"tierra": "fuego"}
var Debilidad = TrianguloD.get(Etype)
func _ready():
	sprite.self_modulate = Flitro
	
func _physics_process(_delta):
	$ProgressBar.value += 1
	move_and_slide()
