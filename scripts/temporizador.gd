extends Label

@export var TinicialM : int = 3
@export var TinicialS : int = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	var tiempo = str(TinicialM) + ":" +str(TinicialS)
	text = tiempo
	


func _on_timer_timeout():
	while TinicialS > 60:
		TinicialS -= 60
		TinicialM += 1
	if TinicialS <= 0:
		TinicialS = 60
		TinicialM -= 1
	TinicialS -= 1
	var tiempo = str(TinicialM) + ":" +str(TinicialS)
	text = tiempo
