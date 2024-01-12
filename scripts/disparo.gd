extends Node2D
class_name disparo_fuego
@onready var Sprite := $AnimatedSprite2D
@export var DañoP: int = 100
@export var DañoA: int = 60
var speed := 500
@onready var dir : Vector2
var  time = 4
var CantEnemys = []
# Called when the node enters the scene tree for the first time.
func _ready():
	var mous = get_global_mouse_position()
	look_at(mous)

func _physics_process(delta):
	position += transform.x * speed * delta
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time -= delta
	if time <= 0 :
		queue_free()

func ColisionEnemy(body):
	body.HP -= DañoP
	for i in CantEnemys:
		i.HP -= DañoA

func _on_hitbox_body_entered(body):
	if body is enemy:
		CantEnemys.append(body)
		print(CantEnemys)
		queue_free()

func _on_hitbox_body_exited(body):
	CantEnemys.erase(body)
	print(CantEnemys)
