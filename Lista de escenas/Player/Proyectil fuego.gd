extends Area2D
@onready var Sprite:= $AnimatedSprite2D

func _ready():
	Sprite.play("Disparo")
