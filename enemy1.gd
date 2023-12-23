extends CharacterBody2D
class_name enemy

#ignorar simples pruebas
@export_category("Stats General")
@export_enum("Slow:150", "Average:200", "Very Fast:300") var speed: int
@export var HP: float = 300.0
@export var range: int = 25
@export_group("ajustesexpress/pruebas")
@export var ActualizarP: float = 1

@export var Escapar: bool 

@export_color_no_alpha var Flitro: Color
@export_flags("Rock", "wind", "water") var TypeElement = 0
@onready var nav_agent := $NavigationAgent2D as NavigationAgent2D
@onready var timer := $Timer
@onready var TimerReload := $ReloadE
@onready var sprite := $Imagen
var padre
var player
var rng = RandomNumberGenerator.new()
var dir
#varibles posiblemente de mas 
var diambular: bool = false
var oneshot = true
func _ready():
	sprite.self_modulate = Flitro
	print(TypeElement)
	padre = get_parent()
	player = padre.get_node("Player") #obtengo la escena del player desde 
	# 								   el arbol de escenas para poder acceder a su posicion
	timer.wait_time = ActualizarP

func _physics_process(_delta):
	if nav_agent.is_navigation_finished(): # evita que se bugue cuando llegue al player
		# pero despues sirve para hacer el daño al player por colision
		return
	if diambular:
		if oneshot:
			oneshot = false
			Pasear()
	else:
		dir = to_local(nav_agent.get_next_path_position()).normalized()
	if Escapar:
		Escape(dir)
		
			
		

	velocity = dir * speed
	move_and_slide()
func Cal_diferencia(punto1, punto2): # me sorprendio que recordara esta toche formula
	var diferencia_horizontal = (punto2.x - punto1.x)
	var diferencia_vertical = (punto2.y - punto1.y)
	var diferencia_diagonal = ((diferencia_horizontal**2 + diferencia_vertical**2)**0.5)
	return diferencia_diagonal
func makepath():
	nav_agent.target_position = player.global_position


func RecargaEscapar(): #tiempo de deambular antes de vlver a escapar
	diambular = false
	Escapar = true

func Escape(dir):
	var diferencia = Cal_diferencia(global_position, player.global_position)
	if diferencia < 250:
		dir *= -1
	elif diferencia > 400 and diferencia < 600:
		diambular = true
		Escapar = false
	else:
		return  
func Pasear():
	rng.randomize()
	dir.x = rng.randf_range(-0.9,0.9)
	dir.y = rng.randf_range(-0.9,0.9)
	TimerReload.start()
func _on_area_2d_body_entered(body):
		Escapar = true
		
		


func TiempoPasear():
	diambular = false
	Escapar = false
	oneshot = true
