extends Node2D
class_name disparo_agua
@onready var Sprite := $AnimatedSprite2D
@export var DañoP: int = 100
var speed := 500
var  time = 3
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

func _on_area_2d_area_entered(body):
	if body is enemy:
		queue_free()
