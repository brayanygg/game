extends Area2D
<<<<<<< HEAD

@onready var Sprite := $AnimatedSprite2D
@export var DañoP: int = 100
@export var DañoA: int = 60
var CantEnemys = []
# Called when the node enters the scene tree for the first time.
func _ready():
	Sprite.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(delta)


func ColisionEnemy(body):
	body.HP -= DañoP
	for i in CantEnemys:
		i.HP -= DañoA


func _on_area_damage_body_entered(body):
	if body is enemy:
		CantEnemys.append(body)
		print(CantEnemys)


func _on_area_damage_body_exited(body):
	CantEnemys.erase(body)
	print(CantEnemys)
	
=======
>>>>>>> b60a81f2be50ef04f156195a6ed6eb2ca3ac9f90
